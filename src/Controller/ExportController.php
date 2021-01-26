<?php

namespace App\Controller;

use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;

class ExportController extends AbstractController
{
   /**
 * @Route("/exportdata", name="get_all_Product", methods={"GET"})
 */
public function export_data(): JsonResponse
{
    $Product = $this->getDoctrine()->getRepository('App\Entity\Product')->findAll(['status'=> 'publish']);
    // $Product = $this->ProductRepository->findBy([
    //     'status'=> 'publish'
    // ]);
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
