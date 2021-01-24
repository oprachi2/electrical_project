<?php

namespace App\Controller\Admin;

use App\Entity\Product;
use App\Form\ProductType;
use App\Repository\CategoryRepository;
use App\Repository\UserRepository;
use App\Repository\ProductRepository;
use Symfony\Component\Routing\Annotation\Route;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Field\IdField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\CollectionField;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextEditorField;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;
use EasyCorp\Bundle\EasyAdminBundle\Field\DateTimeField;
use EasyCorp\Bundle\EasyAdminBundle\Field\IntegerField;
use EasyCorp\Bundle\EasyAdminBundle\Field\AssociationField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ChoiceField;
use EasyCorp\Bundle\EasyAdminBundle\Field\ImageField;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Psr\Log\LoggerInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Component\Validator\Constraints\Choice;

class ProductCrudController extends AbstractCrudController
{
    public function __construct(
        AdminUrlGenerator $adminUrlGenerator, 
        CategoryRepository $CategoryRepository, 
        UserRepository $UserRepository, 
        ProductRepository $ProductRepository, 
        SluggerInterface $slugger,
        LoggerInterface $logger
    ) {
        $this->adminUrlGenerator = $adminUrlGenerator;
        $this->CategoryRepository = $CategoryRepository;
        $this->UserRepository = $UserRepository;
        $this->ProductRepository = $ProductRepository;
        $this->slugger = $slugger;
        $this->logger = $logger;
    }
    public static function getEntityFqcn(): string
    {
        return Product::class;
    }
    
    public function configureActions(Actions $actions): Actions
    {
        $importPostButton = Action::new('importPost', 'Import')->setCssClass('btn btn-default')->createAsGlobalAction()->linkToCrudAction('importPost');
        if ($this->isGranted('ROLE_ADMIN') || $this->isGranted('ROLE_MANAGER')) {
           
            return $actions 
            ->add(Crud::PAGE_INDEX, $importPostButton)
            ->add(CRUD::PAGE_INDEX,'detail');
                
                // ...
            ;
        }
        else{
            return $actions
            ->setPermission(Action::DELETE, 'ROLE_ADMIN')
            ->setPermission(Action::EDIT, 'ROLE_ADMIN')
            ->setPermission(Action::NEW, 'ROLE_ADMIN')
            ->add(CRUD::PAGE_INDEX,'detail');
        }
       
                     
    }

    public function configureFields(string $pageName): iterable
    {
        $uploadPath = $this->getParameter('images');
        return [
            
            AssociationField::new('category'),
            AssociationField::new('managed_by'),
            TextField::new('name'),
            TextField::new('description')->hideOnIndex(),
            TextField::new('extra_features')->hideOnIndex(),
            TextField::new('color')->hideOnIndex(),
            TextField::new('brand'),
            TextField::new('power_supply')->hideOnIndex(),
            TextField::new('model_number'),
            
            ImageField::new('image')->setLabel('Image')->setBasePath($uploadPath['uploads']['url_prefix'])->setUploadDir($uploadPath['uploads']['url_path'])->setRequired(false),
            ChoiceField::new('ratings')->setChoices([
               //'Select' => null,
                '2 star' => '2 star',
                '3 star' => '3 star',
                '4 star' => '4 star',
                '5 star' => '5 star',
            ]),
            IntegerField::new('qt_in_stock')->hideOnIndex(),
            IntegerField::new('market_price')->hideOnIndex(),
            TextField::new('warranty')->hideOnIndex(),
            TextField::new('unit_weight')->hideOnIndex(),
            TextField::new('voltage')->hideOnIndex(),
            TextField::new('availability')->hideOnIndex(),
            DateTimeField::new('created_at')->hideOnForm()->hideOnIndex(),
            DateTimeField::new('updated_at')->hideOnForm()->hideOnIndex(),
            ChoiceField::new('status')->setChoices([
                //'Select' => null,
                 'new' => 'new',
                 'review' => 'review',
                 'publish' => 'publish',
                 
        ]),
            ];
    }
    public function importPost(Request $request)
    {
        $post = new Product();
        $form = $this->createForm(ProductType::class, $post);        
        $form->handleRequest($request);

        $importedFile = $form->get('import_file')->getData();
        if ($form->isSubmitted() && $importedFile) {
            $jsonData = file_get_contents($importedFile);
            $entityManager = $this->getDoctrine()->getManager();
           
            try{
                $postData = json_decode($jsonData);
               
                foreach ($postData as $postItem) {
                    $newPost = new Product();
                    $cat= $this->CategoryRepository->find($postItem->category_id);
                    $cat1= $this->UserRepository->find($postItem->managed_by_id);
                    $newPost->setName($postItem->name);
                    $newPost->setDescription($postItem->description);
                    $newPost->setExtraFeatures($postItem->extra_features);
                    $newPost->setColor($postItem->color);
                    $newPost->setBrand($postItem->brand);
                    $newPost->setPowerSupply($postItem->power_supply);
                    //$newPost->setCreatedAt($postItem->created_at);
                    //$newPost->setUpdatedAt($postItem->updated_at);
                    //$newPost->setManagedBy($postItem->managed_by);
                    $newPost->setModelNumber($postItem->model_number);
                    $url = $postItem->image;
                    // Image path
                    $fname=basename($postItem->image);
                    $img = 'uploads/images/'.$fname.'';
                    file_put_contents($img, file_get_contents($url));
                    $newPost->setImage($fname);
                    $newPost->setRatings($postItem->ratings);
                    $newPost->setQtInStock($postItem->qt_in_stock);
                    $newPost->setMarketPrice($postItem->market_price);
                    $newPost->setWarranty($postItem->warranty);
                    $newPost->setUnitWeight($postItem->unit_weight);
                    $newPost->setVoltage($postItem->voltage);
                    $newPost->setAvailability($postItem->availability);
                    if(!empty($cat)){
                        $newPost->setCategory($cat);
                    }
                    if(!empty($cat1)){
                        $newPost->setManagedBy($cat1);
                    }
                    $newPost->setCreatedAt(new \DateTime());
                    $newPost->setUpdatedAt(new \DateTime());
                    $newPost->setStatus('new');
                    $entityManager->persist($newPost);
                    $entityManager->flush();
                }

                $this->addFlash('success', 'Product(s) data has been imported successfully');
                $this->logger->info('Data imported', $postData);
            } catch (\Exception $e){
                $this->addFlash('error', 'Unable to import data correctly.');
                $this->logger->error('Unable to import data correctly.');
            }
        }else{
            $this->logger->error('File was not uploaded');
        }

        return $this->render('admin/product/import.html.twig', [
            'page_title' => 'Import Product',
            'back_link' => $this->adminUrlGenerator->setController(ProductCrudController::class)->setAction(Action::INDEX)->generateUrl(),
            'form' => $form->createView()
        ]);
    }
/**
 * @Route("/api_all_product", name="get_all_Product", methods={"GET"})
 */
public function getAll(): JsonResponse
{
    $Product = $this->ProductRepository->findBy([
        'status'=> 'publish'
    ]);
    $data = [];

    foreach ($Product as $Products) {
        $data[] = [
                'id' => $Products->getId(),
                'name' => $Products->getName(),
                'brand' => $Products->getBrand(),
                'color' => $Products->getColor(),
                'extra_features' => $Products->getExtraFeatures(),
                'power_supply' => $Products->getPowerSupply(),
                'ratings' => $Products->getRatings(),
                'image' => $Products->getImage(),
                'description' => $Products->getDescription(),
                'modle_number' => $Products->getModelNumber(),
                'qt_in_stock' => $Products->getQtInStock(),
                'market_price' => $Products->getMarketPrice(),
                'warranty' => $Products->getWarranty(),
                'unit_weight' => $Products->getUnitWeight(),
                'voltage' => $Products->getVoltage(),
                'availability' => $Products->getAvailability(),
                'created_at' => $Products->getCreatedAt(),
                'updated_at' => $Products->getUpdatedAt(),
                'status' => $Products->getStatus()
        ];
    }

    return new JsonResponse($data, Response::HTTP_OK);
}

}