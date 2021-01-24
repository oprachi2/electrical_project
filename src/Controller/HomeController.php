<?php

namespace App\Controller;

use App\Repository\ProductRepository;
use App\Repository\ReviewRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(ProductRepository $productRepository): Response
    {
        // $this->getDoctrine()->getManager()->getConfiguration()->getMetadataDriverImpl()->getAllClassNames();
        $product = $productRepository->findBy([
             'status' => 'publish'
        ]);
        return $this->render('home/index.html.twig', [
            'products' => $product
        ]);
    }

     /**
     * @Route("/product/{id}", name="show_product")
     */
    public function show_product($id, Request $request, ProductRepository $productRepository): Response
    {
        $products = $productRepository->find($id);
        return $this->render('home/product.html.twig', [
            'products' => $products
        ]);
    }
    }