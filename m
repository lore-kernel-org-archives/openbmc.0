Return-Path: <akashgj91@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com;
 envelope-from=akashgj91@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qGfE2EDu"; 
 dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42JdRL5726zF3HC
 for <openbmc@lists.ozlabs.org>; Mon, 24 Sep 2018 18:58:54 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id g26-v6so2457571edp.0
 for <openbmc@lists.ozlabs.org>; Mon, 24 Sep 2018 01:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=fzvTVZNXVCrnypZtf/WzoiQy6wBGCWO9AbiJ8Ff2sKY=;
 b=qGfE2EDuXJ6GXZSewzwe5LnxoF+0ddBAj5f7HhpA/b6y+TjZeIe5Ln012YZxD4aJWB
 EgaMf2KivSQsuq7pNRR+v5mXFh7HEJtmry0u5G9GGgpVVf/iu8/QGPRKmYcV6vsSDUib
 qrKuE7QUqF1/cMOOxmkfhFRS46/FaDIgGjhloYTxBzlpXTo8BpII58k7Dg9FllKeIvzp
 Jt8bvrlYD+cq6oKVvj/lTkFfg+pyo5dnZYsATn2BV+3zbuaqgrMATF16k9wZJvkuXXTx
 C2FpRF5X3KqPEom+sNwaalcPYgjUpdBvYwv4Hm3ZPKPAVd0mXhc1Ipgoxz+ylg7TvIav
 BiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fzvTVZNXVCrnypZtf/WzoiQy6wBGCWO9AbiJ8Ff2sKY=;
 b=FzxeZn+rKqmn+IJIC5+Dxpvde39E5syT4w2Ue7aqa1GMXaFryBZg5Yo4ivSo5RdGwz
 rkWcJc+S5UBjTfKqBhMxQZYJrYQNc7SCChJdk3y3EeJTf90CcHTG+LVOGt7hLfdgA/K2
 TMBSMR4FThfJDbCABvipStifrPUpHzJcAAXbIbu4msDskhjeH7qATPxJPc2NYCILAv4x
 Kqv55RM2TJVmQqLpD5DegMyXYffIOXI5uEmeQEDf9tSEaoKh0iRzd0Bofm2BiVQpWgec
 6ZIrvSLMviTpL+6TlAW03YRNQn5HkpPRytNJdNefy9ndtrNnF7q0ClOp1IfH6vZTaRQd
 YFDA==
X-Gm-Message-State: APzg51CZPZaQgea9lmSgposmB5cA7A2L5a+8H8/zn6rLck3QV3eYgbUS
 Cot21wz8Snlz2CmXlmqaRiQExbNm1U3qAfxMYLOeXQ==
X-Google-Smtp-Source: ACcGV60FRu88knPyu8NtoPlxnf5DSSwzALh9hPK+crpw2SYNHSK6W3VOeRa6a283OWRIXhLRNVcn1DZMybtbatAisZw=
X-Received: by 2002:a50:c8c3:: with SMTP id
 k3-v6mr15516940edh.193.1537779529104; 
 Mon, 24 Sep 2018 01:58:49 -0700 (PDT)
MIME-Version: 1.0
From: AKASH G J <akashgj91@gmail.com>
Date: Mon, 24 Sep 2018 14:29:05 +0530
Message-ID: <CAE33tLEEMP2VtXa1MuwkngMN_hXup93q49knLzu2=NmvAo-5yA@mail.gmail.com>
Subject: IPMI Commands Implementation in OpenBMC
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000933fd005769a32f2"
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
X-List-Received-Date: Mon, 24 Sep 2018 08:58:55 -0000

--000000000000933fd005769a32f2
Content-Type: text/plain; charset="UTF-8"

Hi Team,

We are developing a custom board with BMC ast-2500 and firmware (OpenBMC)
for that. Please someone share where exactly IPMI commands are implemented
in OpenBMC code. Thanks in advance.


Thanks and Regards,

Akash G J

--000000000000933fd005769a32f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>We are developing a=
 custom board with BMC ast-2500 and firmware (OpenBMC) for that. Please som=
eone share where exactly IPMI commands are implemented in OpenBMC code. Tha=
nks in advance.</div><div><br></div><div><br></div><div>Thanks and Regards,=
</div><div><br></div><div>Akash G J<br></div></div>

--000000000000933fd005769a32f2--
