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
use Symfony\Component\HttpFoundation\HeaderUtils;
 

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
        $exportPostButton1 = Action::new('exportPost1', 'Export')->setCssClass('btn btn-default')->createAsGlobalAction()->linkToCrudAction('export_data');
        $exportPostButton = Action::new('exportPost', 'Download export')->setCssClass('btn btn-default')->createAsGlobalAction()->linkToCrudAction('exportPost');
        if ($this->isGranted('ROLE_ADMIN') || $this->isGranted('ROLE_MANAGER')) {
           
            return $actions 
            ->add(Crud::PAGE_INDEX, $importPostButton)
            ->add(Crud::PAGE_INDEX, $exportPostButton)
            ->add(Crud::PAGE_INDEX, $exportPostButton1)
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
    public function configureCrud(Crud $crud): Crud{
        if ($this->isGranted('ROLE_ADMIN') || $this->isGranted('ROLE_MANAGER')) {
        
            return $crud
               
                
                
            ;
        }
        }

    public function configureFields(string $pageName): iterable
    {
        $uploadPath = $this->getParameter('images');
        return [
            
            AssociationField::new('category'),
            AssociationField::new('managed_by')->hideOnForm(),
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
                    //$cat1= $this->UserRepository->find($postItem->managed_by_id);
                    try{
                        $newPost->setName($postItem->name);
                        } catch(\Exception $e){
                            $this->addFlash('error','Cant find the name');
                        }
                    
    
                    try{
                        $newPost->setDescription($postItem->description);
                    } catch(\Exception $e){
                            $this->addFlash('error','Cant find the description');
                        }
                    try{
                        $newPost->setExtraFeatures($postItem->extra_features);
                    } catch(\Exception $e){
                            $this->addFlash('error','Cant find the Extra Features');
                        }
                    try{
                        $newPost->setColor($postItem->color);
                    } catch(\Exception $e){
                            $this->addFlash('error','Cant find the Color');
                        }
                    try{
                        $newPost->setBrand($postItem->brand);
                        } catch(\Exception $e){
                            $this->addFlash('error','Cant find the brand');
                        }
                    try{
                        $newPost->setPowerSupply($postItem->power_supply);
                    } catch(\Exception $e){
                            $this->addFlash('error','Cant find the Power Supply');
                        }
                    //$newPost->setCreatedAt($postItem->created_at);
                    //$newPost->setUpdatedAt($postItem->updated_at);
                    //$newPost->setManagedBy($postItem->managed_by);
                    try{
                        $newPost->setModelNumber($postItem->model_number);
                    } catch(\Exception $e){
                            $this->addFlash('error','Cant find the Model Number');
                        }
                    $url = $postItem->image;
                    // Image path
                    $fname=basename($postItem->image);
                    $img = 'uploads/images/'.$fname.'';
                    file_put_contents($img, file_get_contents($url));
                    try{$newPost->setImage($fname);
                    }
                    catch(\Exception $e)
                    {
                        $this->addFlash('error','Cant find the Image');
                    }
                    try{
                        $newPost->setRatings($postItem->ratings);
                    } catch(\Exception $e){
                            $this->addFlash('error','Cant find the Rating');
                        }
                    try{
                        $newPost->setQtInStock($postItem->qt_in_stock);
                    } catch(\Exception $e){
                            $this->addFlash('error','Cant find the Stock ');
                        }
                    try{
                        $newPost->setMarketPrice($postItem->market_price);
                    } catch(\Exception $e){
                            $this->addFlash('error','Cant find the Price');
                        }
                    try{
                        $newPost->setWarranty($postItem->warranty);
                    } catch(\Exception $e){
                            $this->addFlash('error','Cant find the Warranty');
                        }
                    try{
                        $newPost->setUnitWeight($postItem->unit_weight);
                    } catch(\Exception $e){
                            $this->addFlash('error','Cant find the Unit Weight');
                        }
                    try{
                        $newPost->setVoltage($postItem->voltage);
                    } catch(\Exception $e){
                            $this->addFlash('error','Cant find the Voltage');
                        }
                    try{
                        $newPost->setAvailability($postItem->availability);
                    } catch(\Exception $e){
                            $this->addFlash('error','Cant find the Availability');
                        }
                    if(!empty($cat)){
                        $newPost->setCategory($cat);
                    }
                    $newPost->setManagedBy($this->getUser());
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
    public function exportPost()
    {
        try{
            $post = $this->ProductRepository->findDownloadableData();
            $filename = sprintf("%s_%s.json", 'EXPORT_FILE_POST',microtime(true));
            if(empty($post)){
                $this->addFlash('error', "There are no Products available in the list.");
            }else{
                $response = new Response(json_encode($post));
                $disposition = HeaderUtils::makeDisposition(
                    HeaderUtils::DISPOSITION_ATTACHMENT,
                    $filename
                    
                );

                $response->headers->set('Content-Disposition', $disposition);
                $this->logger->info('Data exported', $post);

                return $response;
            }
        } catch (\Exception $e) {
            $this->addFlash('error', "Something Wrong! Try to find the perfect exception. ");
            $this->logger->error('Unable to export data correctly.');
        }

        return $this->redirect($this->adminUrlGenerator->setController(ProductCrudController::class)->setAction(Action::INDEX)->generateUrl());
    }
/**
 * @Route("/export_data", name="get_all_Product", methods={"GET"})
 */
public function export_data(): JsonResponse
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
/**
 * @Route("/productsfinder/{id}", name="get_one_product", methods={"GET"})
 */
public function productsfinder($id): JsonResponse
{
    $Products = $this->ProductRepository->findOneBy(['id'=> $id]);

    $data = [
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

    return new JsonResponse($data, Response::HTTP_OK);
}

}