Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::230; helo=mail-vk0-x230.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dF1A8H5z"; 
 dkim-atps=neutral
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com
 [IPv6:2607:f8b0:400c:c05::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zs4YV6jQszF1hM
 for <openbmc@lists.ozlabs.org>; Thu,  1 Mar 2018 05:57:01 +1100 (AEDT)
Received: by mail-vk0-x230.google.com with SMTP id p189so2128979vkd.10
 for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2018 10:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=LuhnonoZ1N67lpI9LhEvmRDWKzSXTpmncEqTKNU979M=;
 b=dF1A8H5zbay+bpgy6kZCoRXO6RyjQ5pfqsOLDKDHB4aLqR87yNCh8Kom/oDU7i6xrG
 KaZCd8Dg4GBgVMd0r4jtHSI1UOGx4p+19PzJqttY34oDKRqgGRBCo3rpbVFwYuZ1TRHQ
 Skh/hDTuZdW967EOrsZWTx0H2bA/jzgd78MjoXcTK2AoNHXsCx1uQ61AlX8uQcMWu4LL
 1I179oKWwWaIwzio8IcV3OyjsPfWRIRhIAXW2r3Duy7KDYA4Wdq46SlK+JjLEKXLrrjT
 47cWGOkaWTtIi4CPgigGSXTWXJkVjpBXG9TvaRgmj/Rd+dEfx8p/qmmg4pwZm/+Ow/uK
 VjjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=LuhnonoZ1N67lpI9LhEvmRDWKzSXTpmncEqTKNU979M=;
 b=dscxdhTED6sm2x8F347Vw50P4Syiiur8qsas3UaVCQq7hulpg/iaOr8qH2yTAoIV54
 gPD63rjexzgFmTbesXCNKRVVIiw96fNTYlnVxNPgv68VHafDQPq0cGxAYVuUb/mst01l
 A/dgrwc0cRY9bwvBfCEDhGpFeeewRZuNFxxZmeY7MlaH0Dz11yrFieoam+yKl8wqOtyC
 7Yy2Cu2LI95CasI3k6035iLlbDSKWb/NXs2nx4LCal2MM2MO1ulZfxoiziEd0L3Vbvqi
 FYPcy1eJcp4Bhj9xsStPxztvxXAfH6rZHKkc762naxosdd6mof4ZNN5/g8tdmWS6dLSA
 lHxw==
X-Gm-Message-State: APf1xPCQk8sE+rsEMsPldy1EjSACmx2rkCCVdjelK9rtB7ox0mG6aWWh
 RUMlXGYm/FHxcPKRnNXsQ6O38kYCBAUKFTRTODN3NtIC1+o=
X-Google-Smtp-Source: AG47ELvrGVFdqHjsTUaMOC4+C2eM3A/2x01iLWiCtPQzv2wGrdEnXdPGGhmvPv7EFRqqJ5UWWIL1D/nHB0ohAjts5C8=
X-Received: by 10.31.56.208 with SMTP id f199mr13767605vka.45.1519844218736;
 Wed, 28 Feb 2018 10:56:58 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 28 Feb 2018 18:56:48 +0000
Message-ID: <CAO=notzv-4wn7J+uAzPYw1uWzTiN5jOGqHNEDUAzAGS+j5wivQ@mail.gmail.com>
Subject: Exposing POST codes
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 28 Feb 2018 18:57:04 -0000

I talked to Nancy and I think it's time to revisit previous conversations
about POST codes.  We have a simple daemon that exposes the information
over Dbus associated with https://gerrit.openbmc-project.xyz/#/c/5006

If there's interest, I can stage it against skeleton for review and comment.

We have a patch to the kernel character device for the aspeed-lpc-snoop
that is required and enables reading the post codes.

Patrick
