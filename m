Return-Path: <xow@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400e:c01::233; helo=mail-pl0-x233.google.com;
 envelope-from=xow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="aqWscPLV"; 
 dkim-atps=neutral
Received: from mail-pl0-x233.google.com (mail-pl0-x233.google.com
 [IPv6:2607:f8b0:400e:c01::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409dzb49kLzF2Fb
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 04:58:31 +1100 (AEDT)
Received: by mail-pl0-x233.google.com with SMTP id f5-v6so14559539plj.13
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 10:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=UntGKpdXA5DZnF5tjLDNI4IAeq3wn0aLT7/7m1fuChw=;
 b=aqWscPLVaTxLbWmh7NTqXq9GeM2VUAjK/UYfuEXKr9FBncPQ40m00IyrKl+VNDjlx/
 SBSrhuYCBJKn+7xKI8+/krFFEacUUaVk6cU2LzFZ07NzWgJLyDf6GpgF+PgNH1p+/6/T
 ot1kCGFaF3+9AiBzBnDG2fgJbODKDSMjjEcgt8cirX9yovPhdaGbEx3wvJXRQO8W+kFf
 kPJB0/YRvJ1dlJIKkYYYLcnXoR32/4juR/VlpCyrWiyfPPdqGhYvopfcJmX2BjkgrPuH
 FVlIa3Fs6zRPsTzkzq7ACMsIFuZYIQrKGsJU8bIt7xQyG4v82WacdDAw4syszuC/Pdg/
 1PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UntGKpdXA5DZnF5tjLDNI4IAeq3wn0aLT7/7m1fuChw=;
 b=UZXUi7e8gUSSnd7h04kbYjnpkg/BP/9T8ZpD3YUWptQZoT7e9XBzPo6GaxeqZxn2Yh
 iGunzT+abn/VFfchl6tV1dFp3/aPmaXWqX0MJAlhGRpfnaiPycCZ2OQFKmSQQrfpwcwj
 ebbFQ1CjBCHT0VFzpExX9SITcFpp+dCxEgljuz/LPtej8McS/5L9NPQlMSrnFM6qfd21
 jXSC0HwxC+waQkyTsXaz6ow9d4kWt4PJhVfdhRLNxgwRe0bQw1Jp6vqHNnIvcalaSgcs
 tylob7/JJXc025FfDEbKbdk5tRmOhQmlzA9fmNZDuE/8owr+CgqMRF4thuWt77s6C8eD
 TxeQ==
X-Gm-Message-State: AElRT7FGM/GhiUIeOkwsPKHS7cN08JZy4XqMMI0abkhDiZIIotbW/Vtx
 CJ7IVT+8nz9R8e8dz63euB1jNMfrUlzgP6jJYmlZmbAA
X-Google-Smtp-Source: AIpwx4/vwkRRFo+LRc/IKrrKfN/UGMkRxpx0LK0yU7SgZ/5T2xivNvDxUxUBEB2o3KOND9mu7yDcetkbMcG8UqA5Il4=
X-Received: by 2002:a17:902:b783:: with SMTP id
 e3-v6mr298759pls.41.1522173509555; 
 Tue, 27 Mar 2018 10:58:29 -0700 (PDT)
MIME-Version: 1.0
From: Xo Wang <xow@google.com>
Date: Tue, 27 Mar 2018 17:58:18 +0000
Message-ID: <CAPH-5w6f25PWLwhZ6669eB9HrjH50Bq1-L+YqC5R21RAE2aOXA@mail.gmail.com>
Subject: Xo deactivating
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000005325fe056868a3cb"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2018 17:58:36 -0000

--0000000000005325fe056868a3cb
Content-Type: text/plain; charset="UTF-8"

hey y'all,

Heads up that I'm no longer actively working on OpenBMC so please don't
expect expedient code reviews from me. I handed off my Zaius machine layer
maintainership and nobody really touches skeleton these days.

cheers,
xo wang

--0000000000005325fe056868a3cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">hey y&#39;all,<div><br></div><div>Heads up that I&#39;m no=
 longer actively working on OpenBMC so please don&#39;t expect expedient co=
de reviews from me. I handed off my Zaius machine layer maintainership and =
nobody really touches skeleton these days.</div><div><br></div><div>cheers,=
</div><div>xo wang</div><div><br></div></div>

--0000000000005325fe056868a3cb--
