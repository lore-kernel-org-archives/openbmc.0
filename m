Return-Path: <xow@google.com>
Received: from mail-pa0-x236.google.com (mail-pa0-x236.google.com
 [IPv6:2607:f8b0:400e:c03::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sDTl9122jzDr4d
 for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2016 09:55:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=QBJKwMi6; 
 dkim-atps=neutral
Received: by mail-pa0-x236.google.com with SMTP id ti13so30788001pac.0
 for <openbmc@lists.ozlabs.org>; Tue, 16 Aug 2016 16:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=to:references:subject:in-reply-to:from:message-id:date:user-agent
 :mime-version:content-transfer-encoding;
 bh=O38GrbBzNoJxyZ+TRniGUeGzuLQUfaO5qjjBSqyv+YI=;
 b=QBJKwMi6vUrgh78Ok6mig8Rs5gKgW8I2YrpJAxdc5z8hB3HPbsWxRH/vVBmvclkWY6
 edldjlM7Wb/dek4QUjftUdQ0i1P7jJDWBBaAzmAIaIH3Smip7qLt2b8/qvMFnCPPoEMM
 UcwFh3gleVkAx9DKNsbzL+EjFzkbZA9H4+BDRpl9UxUvjGI1gTx+gj3hJ/+kyS+L5G2A
 ncpURVsxYTcHZ5C80HwH3/NIh1use7r1Tk8WumWW/XEerJgmWhcOUqyQ1aHS48dBFKLH
 zop4GLZB8vi6BvF09RS31bY94cjgA+Sy0DTNxQ8oEKu2NceYyhuSW0d7GxaQuPShoiCa
 yGKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:to:references:subject:in-reply-to:from
 :message-id:date:user-agent:mime-version:content-transfer-encoding;
 bh=O38GrbBzNoJxyZ+TRniGUeGzuLQUfaO5qjjBSqyv+YI=;
 b=kzzv3Rs511qAobrNJeyD7XGIIAdk4X9TSD0bPNVz4fCqJhM1eD8CvsOaASkSafB3hX
 zxMjpSevI6hu3tW06aJTh5IBLT4IBPbzN9toyVcfPQtJiXNJ6oUQ0l+L9kMyeUXxoStv
 SVI46LJ8rFB6XTTVSWSiubo46dOs4aqfNNgsLo31llo5WxM5zqDXqZRT0v5+593+YfhR
 MEMUR8KuWdRhWj20WX7gXQXmCWokDxVwehM9t8W3d2j99+ZE+oNl7v1IDZPdOExl5Row
 sfzYj1A5PBp4cEzXo3bELqLsLugZfv3jZ6EsyiZyo7eIGCsCpSAWW97rh8/+Ca/r9ksa
 sW4w==
X-Gm-Message-State: AEkoouuoeb24czCBW3BvoZscyGBe8CUMdkHglfpOkgwt+1qgOfpwxjHtOPZ6wqy+EGRMJu+E
X-Received: by 10.66.182.232 with SMTP id eh8mr69263499pac.146.1471391745666; 
 Tue, 16 Aug 2016 16:55:45 -0700 (PDT)
Received: from pewter.mtv.corp.google.com
 ([2620:15c:202:0:ed8d:31ba:97b4:e69a])
 by smtp.gmail.com with ESMTPSA id q4sm41949565pfb.18.2016.08.16.16.55.44
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Aug 2016 16:55:45 -0700 (PDT)
To: openbmc@lists.ozlabs.org
References: <CACPK8XckyWBdN+B+ieudY8FmgOXR7N4RMGaSt2yuOyZ8tCmodg@mail.gmail.com>
Subject: Re: Linux dev-4.7 tree: Request for testing
In-Reply-To: <CACPK8XckyWBdN+B+ieudY8FmgOXR7N4RMGaSt2yuOyZ8tCmodg@mail.gmail.com>
From: Xo Wang <xow@google.com>
Message-ID: <79e11c2d-2450-735f-094e-d43e329b4c3f@google.com>
Date: Tue, 16 Aug 2016 16:55:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Aug 2016 23:55:49 -0000


 > We need to use a mechanism to tell userspace which device is the
 > vuart. udev? systemd?

I think that's covered by this userspace configuration file: 
https://github.com/openbmc/openbmc/blob/master/meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console.conf 


It specifies the VUART console device as ttyS5, which doesn't exist 
using our current DTS for the EVB.

 > $ ls /sys/devices/platform/ahb/ahb:apb/1e787000.vuart/tty
 > ttyS0
 >
 > We could also set an alias in the device tree?

That's how I did my testing for AST2500 EVB connected to an LPC host. 
This enabled and aliased the vuart for me (please note s/uart6/vuart/g 
for dev-4.7):

diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts 
b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
index 28b0045..51b032d 100644
--- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
+++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
@@ -8,6 +8,7 @@

         aliases {
                 serial4 = &uart5;
+               serial5 = &uart6;
         };

         chosen {
@@ -39,6 +40,10 @@
         status = "okay";
  };

+&uart6 {
+       status = "okay";
+};
+
  &mac0 {
         status = "okay";
  };




cheers
xo
