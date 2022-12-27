@isTest
private class AnimalLocatorTest {

    @isTest
    static void animalLocatorTest() {
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        //HttpResponse response = AnimalCallouts.getAnimalNameById();
        String resultresponse = AnimalLocator.getAnimalNameById(1);
        String expectedresults = 'chicken';
        System.assertEquals(expectedresults, resultresponse);
}
}