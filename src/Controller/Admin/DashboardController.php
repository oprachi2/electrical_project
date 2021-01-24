<?php

namespace App\Controller\Admin;

use App\Entity\Category;
use App\Entity\Product;
use App\Entity\Review;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\CrudUrlGenerator;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
        $routerBuilder=$this->get(CrudUrlGenerator::class)->build();
        return $this->redirect($routerBuilder->setController
        (UserCrudController::class)->generateUrl());
    
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('ELECTRICAL APPLIANCES PROJECT');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linktoDashboard('Dashboard', 'fa fa-home')->setPermission('ROLE_ADMIN');
        if ($this->isGranted('ROLE_ADMIN') || $this->isGranted('ROLE_MANAGER')) {
            yield MenuItem::linkToCrud('Category', 'fa fa-cart-arrow-down', Category::class);
            yield MenuItem::linktoCrud('Product', 'fa fa-shopping-basket', Product::class);
            
        }
        
    }
}