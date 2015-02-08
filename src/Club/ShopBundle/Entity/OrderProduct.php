<?php

namespace Club\ShopBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Club\Account\EconomicBundle\Model\Product as EconomicProduct;

/**
 * @ORM\Entity(repositoryClass="Club\ShopBundle\Entity\OrderProductRepository")
 * @ORM\Table(name="club_shop_order_product")
 */
class OrderProduct extends EconomicProduct
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
     *
     * @var integer $id
     */
    protected $id;

    /**
     * @ORM\Column(type="string")
     *
     * @var string $product_name
     */
    protected $product_name;

    /**
     * @ORM\Column(type="decimal", scale=2)
     *
     * @var float $price
     */
    protected $price;

    /**
     * @ORM\Column(type="integer")
     *
     * @var integer $quantity
     */
    protected $quantity;

    /**
     * @ORM\Column(type="string")
     *
     * @var string $type
     */
    protected $type;

    /**
     * @ORM\ManyToOne(targetEntity="Club\ShopBundle\Entity\Product")
     *
     * @var Club\UserBundle\Entity\Product
     */
    protected $product;

    /**
     * @ORM\ManyToOne(targetEntity="Club\ShopBundle\Entity\Order", inversedBy="order_products")
     * @ORM\JoinColumn(name="order_id", onDelete="cascade")
     *
     * @var Club\UserBundle\Entity\Order
     */
    protected $order;

    /**
     * @ORM\OneToMany(targetEntity="Club\ShopBundle\Entity\OrderProductAttribute", mappedBy="order_product")
     */
    protected $order_product_attributes;

    public function __construct()
    {
        $this->order_product_attributes = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Get id
     *
     * @return integer $id
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set product_name
     *
     * @param string $productName
     */
    public function setProductName($productName)
    {
        $this->product_name = $productName;
    }

    /**
     * Get product_name
     *
     * @return string $productName
     */
    public function getProductName()
    {
        return $this->product_name;
    }

    /**
     * Set price
     *
     * @param float $price
     */
    public function setPrice($price)
    {
        $this->price = $price;
    }

    /**
     * Get price
     * *
     * @return float $price
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * Set quantity
     *
     * @param integer $quantity
     */
    public function setQuantity($quantity)
    {
        $this->quantity = $quantity;
    }

    /**
     * Get quantity
     *
     * @return integer $quantity
     */
    public function getQuantity()
    {
        return $this->quantity;
    }

    /**
     * Set order
     *
     * @param string $order
     */
    public function setOrder($order)
    {
        $this->order = $order;
    }

    /**
     * Get order
     *
     * @return string $order
     */
    public function getOrder()
    {
        return $this->order;
    }

    public function setProduct($product)
    {
      $this->product = $product;
    }

    public function getProduct()
    {
      return $this->product;
    }

    public function addOrderProductAttribute(\Club\ShopBundle\Entity\OrderProductAttribute $orderProductAttribute)
    {
      $this->order_product_attributes[] = $orderProductAttribute;
    }

    public function getOrderProductAttributes()
    {
        return $this->order_product_attributes;
    }

    public function getProductAttributes()
    {
        return $this->order_product_attributes;
    }

    /**
     * Add order_product_attributes
     *
     * @param Club\ShopBundle\Entity\OrderProductAttribute $orderProductAttributes
     */
    public function addOrderProductAttributes(\Club\ShopBundle\Entity\OrderProductAttribute $orderProductAttributes)
    {
        $this->order_product_attributes[] = $orderProductAttributes;
    }

    /**
     * Set type
     *
     * @param string $type
     */
    public function setType($type)
    {
        $this->type = $type;
    }

    /**
     * Get type
     *
     * @return string
     */
    public function getType()
    {
        return $this->type;
    }

    public function getPriceSummary()
    {
      return $this->getPrice()*$this->getQuantity();
    }

    /**
     * Remove order_product_attributes
     *
     * @param \Club\ShopBundle\Entity\OrderProductAttribute $orderProductAttributes
     */
    public function removeOrderProductAttribute(\Club\ShopBundle\Entity\OrderProductAttribute $orderProductAttributes)
    {
        $this->order_product_attributes->removeElement($orderProductAttributes);
    }
}
