Return-Path: <henbinchang@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::236; helo=mail-qk0-x236.google.com;
 envelope-from=henbinchang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aSiR860X"; 
 dkim-atps=neutral
Received: from mail-qk0-x236.google.com (mail-qk0-x236.google.com
 [IPv6:2607:f8b0:400d:c09::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41ky2J5D4WzDqD5
 for <openbmc@lists.ozlabs.org>; Tue,  7 Aug 2018 11:42:48 +1000 (AEST)
Received: by mail-qk0-x236.google.com with SMTP id b66-v6so10389205qkj.1
 for <openbmc@lists.ozlabs.org>; Mon, 06 Aug 2018 18:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lj23V3LEml+5MJVMuKW/saxKrIZUvf5H/FVEWY012IM=;
 b=aSiR860XwvjKmoMIcXRTIRuz/RkkSfJY7Ya72t16C5VZPABUUOyZiYUHk/sstDsxmQ
 RBk9zGlTtmA/wM573cQuC1bnwDQ5kOsM2F7K5kxqlPC1PCBb7y7Z2ztgQVrgt3+jpmXz
 4godojOtJME/lkIHUWjlqlmxAkRLQkbjP9zR93RP8AYlEiYAwG+smlv1AcxVNhzfYEpg
 K3dCHJ7OekI2dGsQK6XbzFVtCsIpIIembia3EKHhlbITOQr6RSeeBEMv5Igolkmt3cUP
 RKQrpjOnb/dsAzRX3fUR8Qsyt+c3XwL1qw3Ntj7ju+V+JTfRcEBJ8Kat2F2WD0UazEsT
 rEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lj23V3LEml+5MJVMuKW/saxKrIZUvf5H/FVEWY012IM=;
 b=iOHiDzB+k/ODu1ClyJJHKhBAOZ6sAtYMTCx9a0IkrrMJAvz/Gw1yR0hPYw2czne0nv
 RnO4+DGWvX4LfBY/fVqRuhmUiV97MqKqQAQEC4nduhIzIyJ++fiD0noXOedaNkFvyZTw
 hkqNC5J9pVcciQqyXoWDTf8yXSDqggCB/GUiyslRoVhKrS9Wx/iPTZQ3EbEWlMg2ZKt0
 Adom031Vwz61QVGESgI7EIT8T/LeTVBHccfCW7BgYTtmROHqTdyQYo9aJch/T2xNhaG/
 MdMphI/K/5VUZ4cCOHdx3mUeO99f6n8kZszMjL9Fj0gylgD4xmgYNWH/8Xo2ySWwrVQ8
 BfdQ==
X-Gm-Message-State: AOUpUlFe917Hol1IMb50aQbkH7ZhHoiQZA0tlkseTpHtT1EHaWnL7agn
 0b4RvV7G4nKHboq3ReWSsCFIw54BsM6ajW2WsT+du11u
X-Google-Smtp-Source: AA+uWPzMfFZvh4kxSmCwtY0DtZT78rjcNQr5aP5+oCBEwH85zAl0liSqXWDizzorVN4gfOR4ZPWgc8aXxhXx8HDoq0o=
X-Received: by 2002:a37:312:: with SMTP id
 18-v6mr10880487qkd.385.1533606165967; 
 Mon, 06 Aug 2018 18:42:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:26a7:0:0:0:0:0 with HTTP;
 Mon, 6 Aug 2018 18:42:45 -0700 (PDT)
From: Henbin Chang <henbinchang@gmail.com>
Date: Tue, 7 Aug 2018 09:42:45 +0800
Message-ID: <CAG9c7cAk-B=cSwWz3373eywPud3mQdBKCBMwb_iwuCcAwX9Udw@mail.gmail.com>
Subject: Patch files not apply while devtool modify linux-aspeed
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000bf77df0572ce8217"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Aug 2018 01:42:49 -0000

--000000000000bf77df0572ce8217
Content-Type: text/plain; charset="UTF-8"

Hi,

We found the patch files would be applied while 'devtool modify
linux-aspeed' after upgrade to Yocto 2.5.
And show the below warning message.

WARNING: SRC_URI is conditionally overridden in this recipe, thus several
devtool-override-* branches have been created, one for each override that
makes changes to SRC_URI. It is recommended that you make changes to the
devtool branch first, then checkout and rebase each devtool-override-*
branch and update any unique patches there (duplicates on those branches
will be ignored by devtool finish/update-recipe)

Can anyone meet the same issue?

Thanks.

--000000000000bf77df0572ce8217
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div><br></div><div>We found the patch files woul=
d be applied while &#39;devtool modify linux-aspeed&#39; after upgrade to=
=C2=A0Yocto 2.5.=C2=A0</div><div>And show the below warning message.</div><=
div><br></div><div>WARNING: SRC_URI is conditionally overridden in this rec=
ipe, thus several devtool-override-* branches have been created, one for ea=
ch override that makes changes to SRC_URI. It is recommended that you make =
changes to the devtool branch first, then checkout and rebase each devtool-=
override-* branch and update any unique patches there (duplicates on those =
branches will be ignored by devtool finish/update-recipe)<br></div><div><br=
></div><div>Can anyone meet the same issue?</div><div><br></div><div>Thanks=
.</div></div>

--000000000000bf77df0572ce8217--
