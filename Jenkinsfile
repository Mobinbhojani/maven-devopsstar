pipeline {
    agent any
    stages {
        stage('git-code-download') {
            steps {
                echo "download code from git"
                git branch: 'main', url: 'https://github.com/Mobinbhojani/maven-devopsstar.git'
            }
        }
        stage('build') {
            steps {
                echo "doing build"
                sh '''docker build -t mobinbhojani/tomcatstar:${BUILD_NUMBER} .
                docker tag mobinbhojani/tomcatstar:${BUILD_NUMBER} mobinbhojani/tomcatstar:latest
                docker push mobinbhojani/tomcatstar:${BUILD_NUMBER}
                docker push mobinbhojani/tomcatstar:latest
                '''
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                kubeconfig(
                    caCertificate: '''-----BEGIN CERTIFICATE-----
                    MIIDKTCCAhGgAwIBAgIIUh89DvT6KiwwDQYJKoZIhvcNAQELBQAwFTETMBEGA1UE
                    AxMKa3ViZXJuZXRlczAeFw0yNDA4MTAwODI1MzFaFw0yNTA4MTAwODMwMzNaMDwx
                    HzAdBgNVBAoTFmt1YmVhZG06Y2x1c3Rlci1hZG1pbnMxGTAXBgNVBAMTEGt1YmVy
                    bmV0ZXMtYWRtaW4wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC2kmjJ
                    U95NZgIgU5WydvUOJ8nZLp9eaz/RNc9Gc89I7J3RPDeViTgyHH00kDCRNJe2dnHX
                    OBgdYvFi1N5/oamla5M8kRjn5bTRDcu7in2w2MANrdMONYYekqLafQL1FY9SZz5p
                    EWBfxPvWu9etLLxegXWqISPLQzVHAh2MwQUgocds6xBFbdhl2GsDLt5RVw09F5x0
                    l2xJrEAqSVmi7/Th4Khb5w4ofhotJbuyQDOFNOT/bYG0N8R7ESr/sUFdX3pUSwjl
                    gtHDHyM+3vq51YykGI9qTTnTiHFiBIZsMH1XVoFIrUPRpmQnWmpYAzbud2p3D6od
                    Tqe2X9USjnNdWBsnAgMBAAGjVjBUMA4GA1UdDwEB/wQEAwIFoDATBgNVHSUEDDAK
                    BggrBgEFBQcDAjAMBgNVHRMBAf8EAjAAMB8GA1UdIwQYMBaAFJL5/do3j+2hCYCp
                    ObE6LpF2KxNRMA0GCSqGSIb3DQEBCwUAA4IBAQCKJG4jI9WV6WDrvfYqF/eo5XGr
                    5ij4Knx+mUkcztBMx2inPw0k78RHaMDANx1aYEHcc0Tu++2/YIouNVMLq4mZhHx8
                    Wbl9BeYv2mFarqv9NgOOJhMTWcvIP9l599kuojwShe3lwvLj+Jkhz5Uos0Q50erM
                    A+wEC6ULG2p1hxn/dLsDH8Z/t2OVMxE9DWH2NhYOj8qHKiawO719XcpIUJ+Hbk4Q
                    3Xl0vSbUv77m/eIjCinAR859FdzjmUMgdkjYxNvpQ+pfVWl6Y4E7J6RPCOhPX9Md
                    IiwRc0NCjmz4YjSfUYb229HnLBvK1mtoibGhEVpOSyZ9bH5oMvfeX/1p0tQP
                    -----END CERTIFICATE-----''',
                    credentialsId: 'kubeconfig-secret',
                    serverUrl: 'https://172.31.47.47:6443'
                ) {
                    // Replace with your actual kubectl commands
                    sh 'kubectl apply -f deployment.yaml'
                }
            }
        }
    }
}
