package org.testkarate;

import com.intuit.karate.junit5.Karate;

public class KarateTestRunnerTest {
    @Karate.Test
    Karate runTests(){
return Karate.run("classpath:Feature").relativeTo(getClass());
    }

    }


