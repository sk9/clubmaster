<?php

namespace Application\Migrations;

use Doctrine\DBAL\Migrations\AbstractMigration,
    Doctrine\DBAL\Schema\Schema;

/**
 * Auto-generated Migration: Please modify to your need!
 */
class Version20111114222639 extends AbstractMigration
{
    public function up(Schema $schema)
    {
        // this up() migration is autogenerated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != "mysql");
        
        $this->addSql("CREATE TABLE club_shop_subscription_ticket_attribute (id INT AUTO_INCREMENT NOT NULL, attribute VARCHAR(255) NOT NULL, value VARCHAR(255) NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = InnoDB");
        $this->addSql("ALTER TABLE club_shop_subscription_ticket ADD subscription_ticket_attribute_id INT DEFAULT NULL");
        $this->addSql("ALTER TABLE club_shop_subscription_ticket ADD CONSTRAINT FK_2DF24DBD44E1E258 FOREIGN KEY (subscription_ticket_attribute_id) REFERENCES club_shop_subscription_ticket_attribute(id)");
        $this->addSql("CREATE INDEX IDX_2DF24DBD44E1E258 ON club_shop_subscription_ticket (subscription_ticket_attribute_id)");
    }

    public function down(Schema $schema)
    {
        // this down() migration is autogenerated, please modify it to your needs
        $this->abortIf($this->connection->getDatabasePlatform()->getName() != "mysql");
        
        $this->addSql("ALTER TABLE club_shop_subscription_ticket DROP FOREIGN KEY FK_2DF24DBD44E1E258");
        $this->addSql("DROP TABLE club_shop_subscription_ticket_attribute");
        $this->addSql("ALTER TABLE club_shop_subscription_ticket DROP FOREIGN KEY FK_2DF24DBD44E1E258");
        $this->addSql("DROP INDEX IDX_2DF24DBD44E1E258 ON club_shop_subscription_ticket");
        $this->addSql("ALTER TABLE club_shop_subscription_ticket DROP subscription_ticket_attribute_id");
    }
}