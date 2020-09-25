#@Gallery feature
Feature: This feature contains gallery page's and its components' test

  Background:
    Given Merchant is on the Login Page
    When Merchant login with "Sprint-100" username, "Test123!" password
    When Merchant should see "Sprint-100" username as on Home Page
  #  Then Merchant go to gallery page

  @check-gallery-page-opening
  Scenario: Check gallery page opening
    Then Merchant should see title as "Görsel Galerisi" in Gallery Page
    Then I see there is no image in gallery page

  @single-image-upload-success-with-no-image
  Scenario: Upload a single image success upload in no image page
    Given Merchant should see title as "Görsel Galerisi" in Gallery Page
    And Merchant open image upload modal in gallery with no images
    When  Merchant upload files in Image Upload Page:
      | emir.jpg |
    Then These images are available in Image Upload Page:
      | name     | message           |
      | emir.jpg | Yükleme başarılı! |

  @single-image-upload-success-with-image
  Scenario: Upload a single image success with upload my computer
    Given Merchant should see title as "Görsel Galerisi" in Gallery Page
    And Merchant open image upload modal in gallery with images
    When  Merchant upload files in Image Upload Page:
      | Single.jpg |
    Then Merchant should see success title
    And These images are available in Image Upload Page:
      | name       | message           |
      | Single.jpg | Yükleme başarılı! |


  @multiple-image-upload-success-with-image
  Scenario: Upload multiple image with upload my computer
    Given Merchant should see title as "Görsel Galerisi" in Gallery Page
    And Merchant open image upload modal in gallery with images
    When  Merchant upload files in Image Upload Page:
      | valid_kedi.jpg |
      | araba.jpg      |
      | HVDM.jpg       |
    Then These images are available in Image Upload Page:
      | name           | message           |
      | valid_kedi.jpg | Yükleme başarılı! |
      | araba.jpg      | Yükleme başarılı! |
      | HVDM.jpg       | Yükleme başarılı! |


  @single-image-upload-with-fail-image
  Scenario: Upload a single image fail with upload my computer
    Given Merchant should see title as "Görsel Galerisi" in Gallery Page
    And Merchant open image upload modal in gallery with images
    When  Merchant upload files in Image Upload Page:
      | FailResim.jpg |
    Then Merchant should see fail title
    And These images are available in Image Upload Page:
      | name          | message               |
      | FailResim.jpg | Fotoğraf yüklenemedi. |

  @image-upload-invalid-files-upload-error-message
  Scenario: Upload an invalid file via upload my computer
    Given Merchant should see title as "Görsel Galerisi" in Gallery Page
    And Merchant open image upload modal in gallery with images
    When  Merchant upload files in Image Upload Page:
      | aspxDosyasi.rar |
      | ExcelVar.rar    |
    Then These files are invalid format toast error message


  @image-upload-success-with-URL
  Scenario: Upload an image success with URL
    Given Merchant click upload image button in gallery page
    When Merchant click upload with URL tab
    When  Merchant upload "https://iasbh.tmgrup.com.tr/ac71ff/0/0/0/0/0/0?u=http://i.sabah.com.tr/sb/galeri/yasam/en-iyi-en-guzel-kedi-fotograflari/1.jpg" URL from Image Upload Page
    Then These images are available in Image Upload Page:
      | 1.jpg |

  @image-upload-fail-with-URL
  Scenario: Upload an image fail with URL
    Given Merchant click upload image button in gallery page
    When Merchant click upload with URL tab
    When  Merchant upload "İnvalid URL" URL from Image Upload Page
    Then Merchant should see invalid URL fail message

  @Single-image-search-and-delete
  Scenario Outline: Delete Single Image
    And Merchant select images:
      | valid_kedi.jpg |
      | Single.jpg     |
    And Merchant delete images:
      | valid_kedi.jpg |
      | Single.jpg     |
    Then Merchant search "<imageName>" in search field in gallery page
    Examples:
      | imageName         |
      | valid_kedi,Single |


  @multiple-image-select-and-delete
  Scenario Outline: Delete multiple Images
    And Merchant select images:
      | Opeth logo.jpg |
      | image.png      |
    And Merchant delete images:
      | Opeth logo.jpg |
      | image.png      |
    Then Merchant search "<imageName>" in search field in gallery page
    Examples:
      | imageName          |
      | Opeth logo, image  |

  @search-an-image-in-gallery
  Scenario: Search an image that is in merchant's gallery
    Given Merchant search "Single" in search field in gallery page
    Then Merchant should see only see images that has "Single" word contained in image name


  Scenario: Check sort strategy
    Given Merchant click sort button
    And Merchant select "Tarihi Sıraya Göre" sort strategy
    Then Merchant should see "En Son Yüklenen" text in sort field
    And Merchant click sort arrow
    Then Merchant should see "İlk Yüklenen" text in sort field
    And Merchant click sort arrow
    Then Merchant should see defauld sort button
    And Merchant click sort button
    And Merchant select "Alfabetik Sıraya Göre" sort strategy
    Then Merchant should see "İsme Göre Azalan" text in sort field
    And Merchant click sort arrow
    Then Merchant should see "İsme Göre Artan" text in sort field
    And Merchant click sort arrow
    Then Merchant should see defauld sort button

  Scenario: Check sort working
    Given Merchant click sort button
    And Merchant select "Tarihi Sıraya Göre" sort strategy
    Then first image should be "1.jpg"
    And Merchant click sort arrow
    Then first image should be "Single.jpg"
    And Merchant click sort arrow
    Then Merchant should see defauld sort button
    And Merchant select "Alfabetik Sıraya Göre" sort strategy
    Then first image should be "Single.jpg"
    And Merchant click sort arrow
    Then first image should be "1.jpg"
    And Merchant click sort arrow
    Then Merchant should see defauld sort button


  @single-image-upload-success
  Scenario: Upload a single image success upload

    When Merchant click product process button
    And Merchant click gallery process button
    Then Merchant should see title as "Görsel Galerisi" in Gallery Page

    When Merchant click upload image button in gallery page
    And  Merchant upload files in Image Upload Page:
      | Vidar22.jpg |
    And Merchant check uploaded image name as "Vidar22.jpg"
    Then Merchant check uploaded image message as "Yükleme başarılı!"





