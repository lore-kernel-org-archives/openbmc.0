Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sjLm82KHwzDrPt
 for <openbmc@lists.ozlabs.org>; Mon, 26 Sep 2016 21:07:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ww+cL/mi; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id 192so2325018vkl.2
 for <openbmc@lists.ozlabs.org>; Mon, 26 Sep 2016 04:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=LYrzRZzJEQcbHkziVpgJuCPWugGHqULxwbD8ezPSox8=;
 b=ww+cL/miX2/5+ktGCo9m/+JZZLMklgt6HrY6PeQoysMun/7aqevIHAIGReS1E2JsDg
 K4UIk7NrRYqYyhTpzIZWG/b2hr6XXwWiCR8oD5UALOv1nwvHq9cuDfI3SXvs06ESHxQw
 MR/w06zFvgUqDTZtICCHJztrfUw6Xi7prsK02731KkzuEf7OlV8Q2151IrgAO1r/BS3b
 kuGvDiJWxGOka0mmTbEpMQrJkUnv4tZS2zco6xXZVOccUkiNlSiMRcitiSdgQMKeNM/g
 M4A6ez3fyEmFINU3j0k7dsg/n2v8JBenQlo4gbLsdq3JsXf5IVehf4ZJQb/UA/SdQjWl
 01Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=LYrzRZzJEQcbHkziVpgJuCPWugGHqULxwbD8ezPSox8=;
 b=O32kR7iZg0tqSDWLjVuawZPUG8vzwtuLJtTaOM+iy36HEUHBI/OUiOaK5lZ4oCaDFg
 4uH63cEW3Qi245pqkEcPjCmrtBr952OL1cSQ+zQo9qGDMS29d2AH9uz5GXmCc0vmabqQ
 RpYumZlVBa3V0bgaT1nXqWpvSfUlP3WQTO2hCjqgZieeNEJtY0isgbd6Ke47zvhi6zx1
 pXZ2HtKyiLhCxGvT4EpB3Ol1a7NWiPylHUQ7fju6/niZ5DfoBzLqgfNGYrbah3FydzSN
 MnxJROP7UqPIjY0WD136VBGCVEGNkSl3D13UJ1FLEPlsZGSurbL90IRb4h88bJdUhEoQ
 0HkA==
X-Gm-Message-State: AA6/9Rm0/OdxVs+UY44nn5hxSX4tgcpCJUku2lbhblNXoGFV8FPXPlhRmNivZ/NmIFz2OjXnmASqOB5BwPOT3w==
X-Received: by 10.31.136.213 with SMTP id k204mr6608879vkd.67.1474888069877;
 Mon, 26 Sep 2016 04:07:49 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.71 with HTTP; Mon, 26 Sep 2016 04:07:29 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 26 Sep 2016 20:37:29 +0930
X-Google-Sender-Auth: n5OWqIhkJHeEA2-af71t7ewfQS8
Message-ID: <CACPK8XfQPDg0H_aNKmZOje7pPDRE9sJsD-epqAB8uW2X6SrrDg@mail.gmail.com>
Subject: openpower.xyz updates
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Sep 2016 11:07:53 -0000

Today I performed some upgrades on openpower.xyz:

 - Upgraded from Ubuntu 14.04 LTS to 16.04 LTS
 - Moved from the one-year free TLS certificate to LetsEncrypt
 - Updated Jenkins from 10 month old version to the latest (2.7.4)

Things appear to be working okay. Please let me know if you notice any
breakages.

Cheers,

Joel
