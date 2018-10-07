Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="kxmMgsuQ"; 
 dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Syl82KbrzF37r
 for <openbmc@lists.ozlabs.org>; Mon,  8 Oct 2018 09:26:27 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id r64-v6so7411410pfb.13
 for <openbmc@lists.ozlabs.org>; Sun, 07 Oct 2018 15:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qBFVdTNJuQITVheEUbsbh90cuw497SQuwlsbCEiD2o8=;
 b=kxmMgsuQSO8Ep6lGuJ0UBuwPdrJVciPhn7HeOtq8Vdrznawc0K6sqp9/GISQfqbAbq
 XbEYAae8bKzsf++CrXITaZzPKJo5/zEMvag7+xVXuxbtjuLNHewPhTP1wQTPwv/1jKNN
 vH+nJuZA/3Vv+gRPolTRFUW3mBS+4BTpPckjUwy8SLwua0AfEzNnTe+zU9UsbGcMn3b+
 Zb7KczActq9bNt3e/ZTH31Nm9Qr6tXrNOOQ0W2pvbwT81eiU9JIiPFFVGPRRUQkaoZwt
 y6N/Kfch1Fvy02IHB4iikcOGyBNqin49bWS22NGVce4rt9PHq4BT7+ej/TWdIg0qiRP0
 CZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qBFVdTNJuQITVheEUbsbh90cuw497SQuwlsbCEiD2o8=;
 b=fL6r6x1ye+4R6BN2MV3wYIosX0DCDA18RiNXKz0RHErqL4usZGQKUFWYELpswrMjwu
 Cq4uWPBeTUpNWvU55QS9kfQi1AyVGl6AazNAmaLyAuMJJVLLQcAYf6ZgK3L5IQpFxv7+
 A3DAI4PJReJP7WXxMwABvOl2QtMYqmy/RbPfGzeUQQt9wYV4B0FAWRakzlTM7thy+svm
 ykP6NBAFG3k7xJ5JZSa2qzPKiiv1PTaguZ+GQAoszvtntK6m5gP5O6GmBsDO3QyxJjas
 qZdQ0VEnkSXI/30msC/ycJXFbLYyFLEErRXkuMyCZ3jBCSNTh9UVnUIYCBW1X4/IOKJP
 8Skg==
X-Gm-Message-State: ABuFfojLLU8ABYGZsjl/QAMYE6dLNIIxJrBFbcPAGv6gu2tFvCAiQLu5
 q7UU6b0u/gUZ6oIUBBPh+qxOhQEomGJyLLsPxAzDXCxC63g=
X-Google-Smtp-Source: ACcGV62JWdbgO0r+QjI5dd6nwl1GCtSG8Fq3Kjj+U78QSV1MDsHwOfCu+Ukul3euXpiM5j3uGxsuFRkqBsDEjcOVvHs=
X-Received: by 2002:a63:9507:: with SMTP id
 p7-v6mr18967878pgd.449.1538951184938; 
 Sun, 07 Oct 2018 15:26:24 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Sun, 7 Oct 2018 15:25:39 -0700
Message-ID: <CAO=notx4Csmkf8f-PkrTST4kKu_petj4+CF4f_oC4venws2FXA@mail.gmail.com>
Subject: New Repo Request: google-ipmi-i2c
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Peter Hanson <peterh@google.com>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 07 Oct 2018 22:26:29 -0000

After reviewing the use cases, this extension to IPMI may belong as
part of the google suite of openbmc customizations we want to publish.

I request a new repository: google-ipmi-i2c
Maintainer permissions list group thing: the same as meta-google**

I'll be converting Peter's design document into markdown and then ask
him to send up the code currently under review here:
https://gerrit.openbmc-project.xyz/12604 to be the contents of that
repo.

**I'm not sure how things are fully organized, the meta layers have
groups, presumably all the daemons have groups.  My brain is a little
fried this Sunday.

Thanks,
Patrick
