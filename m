Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 8BEE01A09F0
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 02:10:31 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447427427370360.73871798769153;
 Fri, 13 Nov 2015 07:10:27 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH phosphor-rest-server] Add self-signed cert
Date: Fri, 13 Nov 2015 10:10:25 -0500
Message-Id: <1447427425-3614-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447427425-3614-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447427425-3614-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Nov 2015 15:10:32 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Eventually will be running with SSL.
---
 cert.pem | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 setup.py |  6 ++++--
 2 files changed, 52 insertions(+), 2 deletions(-)
 create mode 100644 cert.pem

diff --git a/cert.pem b/cert.pem
new file mode 100644
index 0000000..095da08
--- /dev/null
+++ b/cert.pem
@@ -0,0 +1,48 @@
+-----BEGIN CERTIFICATE-----
+MIIDbzCCAlegAwIBAgIJAL6IhnBSzF8HMA0GCSqGSIb3DQEBCwUAME4xCzAJBgNV
+BAYTAlhYMRUwEwYDVQQHDAxEZWZhdWx0IENpdHkxFDASBgNVBAoMC29wZW5ibWMu
+b3JnMRIwEAYDVQQDDAlsb2NhbGhvc3QwHhcNMTUxMTA2MjAzNTA2WhcNMTYxMTA1
+MjAzNTA2WjBOMQswCQYDVQQGEwJYWDEVMBMGA1UEBwwMRGVmYXVsdCBDaXR5MRQw
+EgYDVQQKDAtvcGVuYm1jLm9yZzESMBAGA1UEAwwJbG9jYWxob3N0MIIBIjANBgkq
+hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0wl2ji+GPUpg21yjyo5jh+KwnZsV91wV
+EO1DM6bdHbM/p34GkNRC6PO6DMDc3lGXaoVLHgdxhNMO/7lPwrAbO2dUyjoo4RCP
+O23hWadodstfhgCMa5/h6rSbxtpVsnWD3nBh88tlug+jBZ625d6S+5MglfgrrQai
++gYC9xDzCmMN7yWsfKWO8WfrMfebkB7c+TuWnF/O6u/wmUEZOybavrfP79MuLbwC
++UkxF6PwiThGD7yINXSTxCDCN58MTrDML8AF7CWzBsYycJlJfcs2ix32Csk1FIey
+t+Ze+tzEIzvOb/1G0hkIg40msFaWWEgXX9MIDHDGONwYyejb4nO8mQIDAQABo1Aw
+TjAdBgNVHQ4EFgQUgoShQ/gqY2/oZWMRU4jJdAim38cwHwYDVR0jBBgwFoAUgoSh
+Q/gqY2/oZWMRU4jJdAim38cwDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQsFAAOC
+AQEAg2qFx8mu5Z0QBSZK3FZhNVAsbZwZuH7cjRGxWYwNlyaS24fVdts7q8YBRjpm
+OZJLO+gBYkCRJnZ/AlfJ0yorT7p7Z0GTP4GrtPmh8eLoh/q5NLUGN7T2IkTea+Q+
+4iorkAuYzmSviJNUZF99MhpbuPY8wCNQWPI13X6YRrJUxQGWOj7LmqR7gE9lSPiw
+xXlrWvR1tc48Z20bEXR08nDH1m5G208BgtLRk53FdYGExebpoEQokQaYyJ6b4L2A
+zkFLExO+ngn49ceC9XASlN4MnKvl4FiSOQqfLhKHjwpzVuMWifV/hlY9GGVbodeg
+lUFi3n1XfYxNtiNSDZvWcBWKtA==
+-----END CERTIFICATE-----
+-----BEGIN RSA PRIVATE KEY-----
+MIIEowIBAAKCAQEA0wl2ji+GPUpg21yjyo5jh+KwnZsV91wVEO1DM6bdHbM/p34G
+kNRC6PO6DMDc3lGXaoVLHgdxhNMO/7lPwrAbO2dUyjoo4RCPO23hWadodstfhgCM
+a5/h6rSbxtpVsnWD3nBh88tlug+jBZ625d6S+5MglfgrrQai+gYC9xDzCmMN7yWs
+fKWO8WfrMfebkB7c+TuWnF/O6u/wmUEZOybavrfP79MuLbwC+UkxF6PwiThGD7yI
+NXSTxCDCN58MTrDML8AF7CWzBsYycJlJfcs2ix32Csk1FIeyt+Ze+tzEIzvOb/1G
+0hkIg40msFaWWEgXX9MIDHDGONwYyejb4nO8mQIDAQABAoIBAQCE/a2spN5fuYOY
+OaUufNTUSVMrvxP0sh7EcACtiDZIBTHUB2Nz2Y/g5dcVOmT15U0aX62a2u362lbV
+aJ6O/hPrN48DcetZCep5dSFSMmFum3MzKx1SpYrlMbQJeIYQ1GWpxAC2djNBMaF2
+ZTK1YbIWv/0FBUPg4hHKpgcwU4oVvHj8W45ORY9/tJB4yPrdVewwtBQ1iJkEPgfO
+H5/jjGfwPHgLYnzMtu1PU1tqNVWgXw19Zn3W6wf1v+f4abrhSZSRoHqciMC10da9
+sMmhmdsi0ZWYQSn4TRRI4i9zZXuQhz/5HOUtt38JCpnkqWeEA7OHwrzyi1uHZHh0
+7TrcW11BAoGBAPenwCy7jaZXdTnpckfNWDLT2Qp07dmw8WocrbCdMUUK5DTXH8Yh
+xdEt5O4Vu6qdC8ccfIlS5DTVfddqrNLPuCpOpUmZVbGQeX6h9FoAyHG5YSuiZtXD
+QHfWM8CJY8tT5OYTDGGgvbLSQehVKQ+a5n9ubB8YvFmtoEl2qaWgi6+FAoGBANol
+2LnV8jXggwsN/13Jw1uIPNrKj6VClDUizLIQAsDwhS4aJeFLldTtIeVAPDovMDQX
+/r33EDd0eev2w3E9Sd8Th4GaxOo9Iho8I2o0aqbjdfnT3/DsuAo5KARvzjiEvbnf
+J5oTM+6eqdCyL1woy2Slqp5Wm1538ZoPALteG8MFAoGAQ9tl75vQOyS5jQ2m73+X
+TA356UCSr1QpQb7r5Hmdt2I9lzDeluZIEoG1uXqg+iWfxYXLpcDdoJBis7SZ+AVM
+W+NCrMDj1wxUDduIXWTbhzWZJ2CPNsESGAPMGFRM0LiC/nt3qARoFehAgM1cu9bg
+k0gJPhgD+7p0MczevPAZdhUCgYBPUi+p8wdtW8OKg351heXJJJKsI7dzqe/mGk8/
+995odYyXpN5dO3Sxxb/rch30MjBe4NK6FFoLMAkdKc8LH/P6b0l4cORlH/GEhJWE
+Cqc1I8REISxumESbQwkwA8+CcZHjQidOOOlLPNoWjpP1+MdsQ2j0xh0cjpSFJitn
+9eI2WQKBgBNC7ap56noSUH+aYQ/kNuiyJyaodPGsbG6eOkP2BeAGpzOGHluW7bun
+zzfP9nichU4lMijWCj0OnM8hzoyOJgA4pM5xoHJICMqRyfAgjUvOvG/bYKBlJv11
+i3KtkYzDp7auH+FetsCJsDGLSSi3qEa42cmK7Gy9PQXcetImH+tu
+-----END RSA PRIVATE KEY-----
diff --git a/setup.py b/setup.py
index 2ddb129..f5f25e9 100644
--- a/setup.py
+++ b/setup.py
@@ -1,5 +1,7 @@
 from distutils.core import setup
-setup(name='Phosphor REST',
+
+setup(name='obmc-rest',
       version='1.0',
-      scripts=['phosphor-rest']
+      scripts=['phosphor-rest'],
+      data_files=[('obmc-rest', ['cert.pem'])],
       )
-- 
2.6.3
