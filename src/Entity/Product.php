<?php

namespace App\Entity;

use App\Repository\ProductRepository;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ProductRepository::class)
 */
class Product
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $brand;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $color;
    /**
     * @ORM\Column(type="string", length=255)
     */
    private $image;

    /** 
     * @ORM\Column(type="string", columnDefinition="ENUM('2 star', '3 star', '4 star', '5 star')") 
     */
    private $ratings;
    /** 
     * @ORM\Column(type="string", columnDefinition="ENUM('new', 'review', 'publish')") 
     */
    private $status;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $power_supply;
    /**
     * @ORM\Column(type="string", length=255)
     */
    private $extra_features;

    /**
     * @ORM\Column(type="datetime")
     */
    private $created_at;

    /**
     * @ORM\Column(type="datetime")
     */
    private $updated_at;

    /**
     * @ORM\ManyToOne(targetEntity=Category::class, inversedBy="products")
     * @ORM\JoinColumn(nullable=false)
     */
    private $category;

    /**
     * @ORM\ManyToOne(targetEntity=User::class, inversedBy="products")
     * @ORM\JoinColumn(nullable=false)
     */
    private $managed_by;

    /**
     * @ORM\Column(type="text")
     */
    private $description;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $model_number;

    /**
     * @ORM\Column(type="integer")
     */
    private $qt_in_stock;

    /**
     * @ORM\Column(type="integer")
     */
    private $market_price;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $warranty;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $unit_weight;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $voltage;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $availability;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getBrand(): ?string
    {
        return $this->brand;
    }

    public function setBrand(string $brand): self
    {
        $this->brand = $brand;

        return $this;
    }

    public function getColor(): ?string
    {
        return $this->color;
    }

    public function setColor(string $color): self
    {
        $this->color = $color;

        return $this;
    }

    


    public function getPowerSupply(): ?string
    {
        return $this->power_supply;
    }

    public function setPowerSupply(string $power_supply): self
    {
        $this->power_supply = $power_supply;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeInterface $created_at): self
    {
        $this->created_at = $created_at;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updated_at;
    }

    public function setUpdatedAt(\DateTimeInterface $updated_at): self
    {
        $this->updated_at = $updated_at;

        return $this;
    }

    public function getCategory(): ?Category
    {
        return $this->category;
    }

    public function setCategory(?Category $category): self
    {
        $this->category = $category;

        return $this;
    }

    public function getManagedBy(): ?User
    {
        return $this->managed_by;
    }

    public function setManagedBy(?User $managed_by): self
    {
        $this->managed_by = $managed_by;

        return $this;
    }

    public function getRatings(): ?string
    {
        return $this->ratings;
    }

    public function setRatings(string $ratings): self
    {
        $this->ratings = $ratings;

        return $this;
    }

    public function getImage(): ?string
    {
        return $this->image;
    }

    public function setImage(string $image): self
    {
        $this->image = $image;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(string $description): self
    {
        $this->description = $description;

        return $this;
    }

    

    public function getModelNumber(): ?string
    {
        return $this->model_number;
    }

    public function setModelNumber(string $model_number): self
    {
        $this->model_number = $model_number;

        return $this;
    }

    public function getQtInStock(): ?int
    {
        return $this->qt_in_stock;
    }

    public function setQtInStock(int $qt_in_stock): self
    {
        $this->qt_in_stock = $qt_in_stock;

        return $this;
    }

    public function getMarketPrice(): ?int
    {
        return $this->market_price;
    }

    public function setMarketPrice(int $market_price): self
    {
        $this->market_price = $market_price;

        return $this;
    }

    public function getWarranty(): ?string
    {
        return $this->warranty;
    }

    public function setWarranty(string $warranty): self
    {
        $this->warranty = $warranty;

        return $this;
    }

    public function getUnitWeight(): ?string
    {
        return $this->unit_weight;
    }

    public function setUnitWeight(string $unit_weight): self
    {
        $this->unit_weight = $unit_weight;

        return $this;
    }

    public function getVoltage(): ?string
    {
        return $this->voltage;
    }

    public function setVoltage(string $voltage): self
    {
        $this->voltage = $voltage;

        return $this;
    }

    public function getAvailability(): ?string
    {
        return $this->availability;
    }

    public function setAvailability(string $availability): self
    {
        $this->availability = $availability;

        return $this;
    }

    public function getExtraFeatures(): ?string
    {
        return $this->extra_features;
    }

    public function setExtraFeatures(string $extra_features): self
    {
        $this->extra_features = $extra_features;

        return $this;
    }

    public function getStatus(): ?string
    {
        return $this->status;
    }

    public function setStatus(string $status): self
    {
        $this->status = $status;

        return $this;
    }
    public function toArray()           
        {
            return [
                'id' => $this->getId(),
                'name' => $this->getName(),
                'brand' => $this->getBrand(),
                'color' => $this->getColor(),
                'extra_features' => $this->getExtraFeatures(),
                'power_supply' => $this->getPowerSupply(),
                'ratings' => $this->getRatings(),
                'image' => $this->getImage(),
                'description' => $this->getDescription(),
                'modle_number' => $this->getModelNumber(),
                'qt_in_stock' => $this->getQtInStock(),
                'market_price' => $this->getMarketPrice(),
                'warranty' => $this->getWarranty(),
                'unit_weight' => $this->getUnitWeight(),
                'voltage' => $this->getVoltage(),
                'availability' => $this->getAvailability(),
                'created_at' => $this->getCreatedAt(),
                'updated_at' => $this->getUpdatedAt(),
                'status' => $this->getStatus()
                    ];
            }

    

   
}
