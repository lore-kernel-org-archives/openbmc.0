Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PsDtKneI"; 
 dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43ZYpj1jhFzDqXb
 for <openbmc@lists.ozlabs.org>; Thu, 10 Jan 2019 03:04:12 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id i6so6698661oia.6
 for <openbmc@lists.ozlabs.org>; Wed, 09 Jan 2019 08:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8y4AoP+yx8vzO3EggaWBdz9jkh5PzEd1ftLbQHQR/iM=;
 b=PsDtKneI56S+2ZFOLbRl8Y8L69dyjKnVTgc9FfD3VORZtDAa+/jyyiT805x+/AACHP
 MkPwOacqLmppWEY6P3G2bPp7uZIJfK47uhUYfIaDZrvjfVAdDvicAdb/ssypdgI051zs
 GPK3ukKmzIKxvsESm74NeOomVuo8iLGqIRJh2gx42bN0j9uNI4JiNzdmIEJ76K4JVawC
 f1oGIQFomLyF2WpJn3TVYYj0NtXyfSxMxAMpuHIdMrZAEa0RXj2iD9CAPK+ejTYeaPmv
 aypmH6eDcZ6t+p/aPo7uSyDGfcl0wMPa1yUi75ujo7mj/fOD4tMShlafTVum2rCsPHea
 YJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8y4AoP+yx8vzO3EggaWBdz9jkh5PzEd1ftLbQHQR/iM=;
 b=fHlS2f8elwE5hP7OPfFr3cqAHvOB5xkllUVj/EeGnpsoK9Ayv7nXbPs5HHqPdI7Da1
 1xy8DynVMAI2Cs7tGLHE8NDAyJpvJOlbx3brrwlq/VQXu0u/Z2yUdkgXVXswtYLDlBAJ
 JwPgW+PPFv4d2uMzcbOkPI6AX1TjXusp97zN97ijtQTEm5kQ6hiSjhgt4I2+oARVzKOM
 fSWChkcKEoxdG+VhIDWF46KWxSPaxTmXV9J/JmWOWPMcCxsVkN/wlyMDOmUcZtjNAHZl
 MtvdshjDgOS3AuFkG1mIYeeE5bIBQxngCOXUMRrs4ogSMbRRkLH8VhgUQ7H3DwTy+tJQ
 gVKA==
X-Gm-Message-State: AJcUukc1Lq3K3Ie3mpH5Q6yRST2yKhZ1W8S7cfZkaZEN42iSQOHIe0wG
 +GTOyV4qW/DEggZdctxlchbvugz8o55mRuMJyxUwkJMn
X-Google-Smtp-Source: ALg8bN6eaBLXBjm0lVYELE9FI5TRibhdN9wUL1IEQCwtCQn8UCEd51Ixw7s2pk7JIF82eLWhI++FhwDGt/bHcxahtzo=
X-Received: by 2002:aca:b9d6:: with SMTP id j205mr4114473oif.294.1547049850438; 
 Wed, 09 Jan 2019 08:04:10 -0800 (PST)
MIME-Version: 1.0
From: Andrew Geissler <geissonator@gmail.com>
Date: Wed, 9 Jan 2019 10:03:54 -0600
Message-ID: <CALLMt=pHLO+-F0TE1i3o+N9+q25HFuZGENit=91BNa0U3enkqA@mail.gmail.com>
Subject: Infrastructure Workgroup Today - 3:00pm CT
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 09 Jan 2019 16:04:14 -0000

We'll be discussing the recent jenkins job refactor, infrastructure
updates, new CI features, and release branch readiness.

https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup

Andrew
