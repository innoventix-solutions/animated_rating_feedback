allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// android/build.gradle
buildscript {
    ext.kotlin_version = '1.9.10'  // Update Kotlin version to the latest version

    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:7.0.2'  // Compatible with Kotlin 1.9.10
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.buildDir = "../build"
subprojects {
    project.buildDir = "${rootProject.buildDir}/${project.name}"
}

tasks.register("clean", Delete) {
    delete rootProject.buildDir
}
