package examples.apis;

import com.intuit.karate.junit5.Karate;

class TestRunner {
    
    @Karate.Test
    Karate testAPIs() {
        return new Karate().feature("category_api_tests").relativeTo(getClass());
    }    

}
