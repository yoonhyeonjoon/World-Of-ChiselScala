//https://docs.gradle.org/current/userguide/kotlin_dsl.html

plugins {
    scala
    kotlin("jvm") version "1.3.72"
    `kotlin-dsl`
}

configurations {
    scalaCompilerPlugins
}

tasks.withType<ScalaCompile>().configureEach {
    println("task run")
    scalaCompileOptions.additionalParameters = listOf(
        "-feature",
        "-language:reflectiveCalls",
//        "-Xfatal-warnings", //: unusedImport Check
        "-Xlint",
        "-Xplugin:" + configurations.scalaCompilerPlugins.get().asPath
    )
}

repositories {
    mavenCentral()
    maven(url = "https://repo1.maven.org/maven2/" )
    maven(url = "https://oss.sonatype.org/content/repositories/snapshots/" )
}


dependencies {

    implementation("org.scala-lang:scala-compiler:2.12.15")// https://mvnrepository.com/artifact/org.scala-lang/scala-compiler //
    implementation("org.scala-lang:scala-library:2.12.15")
    implementation("org.scala-lang:scala-reflect:2.12.15")
    implementation("edu.berkeley.cs:rocketchip_2.12:1.5-SNAPSHOT")
    scalaCompilerPlugins("edu.berkeley.cs:chisel3-plugin_2.12.7:3.5.2")
    implementation("org.scalatest:scalatest_2.12:3.2.11")
    implementation("edu.berkeley.cs:chiseltest_2.12:0.5.2")
    implementation("org.easysoc:layered-firrtl_2.12:1.1.1")
//    addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.5.0" cross CrossVersion.full),

}


