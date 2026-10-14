package petstore;

import com.intuit.karate.junit5.Karate;

class PetstoreRunner {

    @Karate.Test
    Karate testPetstore() {
        return Karate.run("petstore").relativeTo(getClass());
    }
}