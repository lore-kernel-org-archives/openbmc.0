Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x22e.google.com (mail-yb0-x22e.google.com
 [IPv6:2607:f8b0:4002:c09::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDc4f27ZFzDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 11:42:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mwGBNNA6"; 
 dkim-atps=neutral
Received: by mail-yb0-x22e.google.com with SMTP id p143so12278980yba.2
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 18:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=8GGTjVEOL6KgawDUR8+aN3nSO2gDr0X0J2JcTkU/b5E=;
 b=mwGBNNA6ACD37+w+Vmzv3NMgnXVZ6p39CEhUQbJbm6RZbtJUo4B9YjoEis2FgPWp8p
 w9uIGt5LDaPyfEfrhli8x0YFmV7D4x9lftMUfnjwtwpp/PRKt24Cwlhqw6BXBaqxRe1S
 ZHzEko0aSFiWwy8ekOdFKM2cBoDI6SN/OOREAokmXc72bG2Bp0SAYUpX3IjvFpeMi9Vw
 TfjLYYUGe9hu54R7czqyZRPlIzwCPfcRPmmsjYYLI6/c0J5uAYHXUy/T2amy9QTLQrEy
 0j5KdvbR1XnW8wsKKuKyQjKhMp79Wp28F2FAse4iR+zOvPSmBQ+vZvPoAw6FVXyTUq+2
 rviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=8GGTjVEOL6KgawDUR8+aN3nSO2gDr0X0J2JcTkU/b5E=;
 b=cA4gAwBxmo965RlKQ5xDgEiqgnTcgbqEBHyrX8lvQHRVsPDGBTWrRcPm+l3EnWXC8U
 UDDUQowGy6zZJ5lhkYHyEjKeLLOUKsd7dfUcZ2cxe0dU7ntAlW3R+4QrJTZCg0ZItfIz
 V8CESykiA+3oBAaEAI0F4vNxNIaDD46xX88Cczr7MWrmSL15JoOYQY+vTIfNseT9joyx
 CIjc8YpsUgjsnPCqJA6zYrwhtZ2ZJRe86agQ4FuBJp4q9FO7dbrWuSRlApySuwCCyU50
 +39c05q6pxHNNcKZGoUpy9Jf9q+ZKpm3LK2bDup3yKbNgzOkZEXhhYeUQftxZRlzOook
 TDcg==
X-Gm-Message-State: AN3rC/4yA5t//24yWvIBkXZTZWOwOZtJhU3TJiCkaeeI4WpZNDTQj1qg
 nzt43miF/eNwl3A7FFBfzgWkgJ+EivSOEF9Lbw==
X-Received: by 10.37.164.101 with SMTP id f92mr3701297ybi.152.1493343727537;
 Thu, 27 Apr 2017 18:42:07 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 18:41:46 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 28 Apr 2017 11:11:46 +0930
X-Google-Sender-Auth: bEF-QjAhDf-N3fQKZqZwMyd8arQ
Message-ID: <CACPK8Xfcn+t0WcWuDVXz9zRE3S1k_SNd359gNbuGrttttBjOMw@mail.gmail.com>
Subject: Linux dev-4.10 tree updated
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
X-List-Received-Date: Fri, 28 Apr 2017 01:42:11 -0000

The dev-4.10 tree has been pushed. Significant changes merged in this push:

 - Benh's ftgmac100 work (backported)
 - Andrew J's gpio/pinconf work (backported)
 - Device tree sync with dev-4.7. All recent patches were pulled across
 - Brendan's i2c work (v7 from the mailing list)
 - Chris B's fsi work (v6 from the mailing list)
 - Reworked defconfigs for fast network performance and including new drivers

The device trees should be equivalent with dev-4.7 as of
65effbd2d0c36aab06555e59add12b498c8a1aba.

Thank you everyone. The next step is to integrate this with the yocto
build for integration testing.

Cheers,

Joel
