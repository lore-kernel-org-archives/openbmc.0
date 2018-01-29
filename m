Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::232; helo=mail-qt0-x232.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MTFzif2b"; 
 dkim-atps=neutral
Received: from mail-qt0-x232.google.com (mail-qt0-x232.google.com
 [IPv6:2607:f8b0:400d:c0d::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVL360H2tzDqs4
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 17:59:13 +1100 (AEDT)
Received: by mail-qt0-x232.google.com with SMTP id z11so11462506qtm.3
 for <openbmc@lists.ozlabs.org>; Sun, 28 Jan 2018 22:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:from:date:message-id:subject:to;
 bh=bt8R3CEBM81HhX/Td+IbwBPY9prbTOFGeD6jLy6VEqk=;
 b=MTFzif2b3//AVu4c1IISGutEsXYGniHdt4867PLxZCBRAOdB9AZNMzg7VMon3b4vXf
 cO/0swwQ40yQbg0fPWHkupNRXjxAbz1RGiCeAGegbzGbptQ6nLYIi7IJ8opz7GfIRsr4
 Q0EcMLhxAUGOUGTyGkZY9OtT9r+tAn0LuNfEkDMya5G//3JSplz39wEF0vINiwf8pTom
 sZlIY6B9rSP254Jn+N1+bcHXZY/XtNV06qipocPUgigATvsdGLm4ZUGEAusgHw6JKlYb
 CZomtagwrv76zbaUquMAnrv6s9QRxg5yI2fuSrN7lot9+S9IufEUjVQtNDSd2mMTfiDg
 8zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to; bh=bt8R3CEBM81HhX/Td+IbwBPY9prbTOFGeD6jLy6VEqk=;
 b=m3Dvy4qXlFl0diJ9R7N+K6pvu0WOM9TBFj+nb5fLsa4QY0jM1Rlek0IDGz35gOwbNf
 Zoa4P3zwTk6FCRXe8JoeM5qm33Ii2c57JlRO2s+gD7mlOuDPYE7l7WGUPU9fk07NI0on
 /kT/jHlhuQipuG+h8Ni4w8UaPlCjMpJMMzbbVQfCpqT2U8bgxCAvKcWc3ghX1LAMB9jg
 Aiv+c6EPQVdwcVc8yUOYdUVxVcW/gSjJbH6uEGJS6ILjgJDSgHJnjqbNP/fNYU7vlsej
 i+LQiFaq3w6LQ9pCTX5WerbpRoGPU3k9K32P8cfmvCds/uw0o/seBnnjER1dawmVLtK8
 wEIg==
X-Gm-Message-State: AKwxytdX4efMEcT7dKUuO10AGSir/f4kIqPO9ACAm8XI0ENZbzDpDvvo
 eITM+Og2COawl3331QXO47uv8mR4EcIFuLZoyheBBFJe
X-Google-Smtp-Source: AH8x224PgAqugXjlmqRY9vEYvsjBCNrBOxDItBnnES6kcknJFToIAEMcNgbiOS2t3GYKgvtxZHLdU7niyZvYupO9TUI=
X-Received: by 10.200.52.52 with SMTP id u49mr36236835qtb.130.1517209150499;
 Sun, 28 Jan 2018 22:59:10 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.93 with HTTP; Sun, 28 Jan 2018 22:58:50 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 29 Jan 2018 00:58:50 -0600
X-Google-Sender-Auth: hXbdptVlVCUShJVRGjqr6q6toCQ
Message-ID: <CACPK8XfKMTv+=LJbdoMDOOkQ4izwqq81=vHmM-Z8x6GZ6FyqGA@mail.gmail.com>
Subject: Removing Barreleye, Firestone, Garrison
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jan 2018 06:59:14 -0000

Hello,

I am working on ensuring the boards that we build for are working with
the dev-4.13 kernel branch. Currently Barreleye, Firestone and
Garrison systems fail as there has not been a device tree forward
ported.

Is there an interest in maintaining these platforms?

If not, I will remove them from CI on Friday to unblock the kernel work.

This does not stop someone re-enabling them in the near future should
interest arise. However, I suggest we create a policy on removing
abandoned machines when there is no one actively maintaining them, and
we use this to delete machines once they reach the agreed criteria.

Cheers,

Joel
