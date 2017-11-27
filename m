Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c05::22d; helo=mail-vk0-x22d.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="F0HyuNH4"; 
 dkim-atps=neutral
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com
 [IPv6:2607:f8b0:400c:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ylrCp0KDMzDql1
 for <openbmc@lists.ozlabs.org>; Tue, 28 Nov 2017 02:23:16 +1100 (AEDT)
Received: by mail-vk0-x22d.google.com with SMTP id j67so17571407vkd.8
 for <openbmc@lists.ozlabs.org>; Mon, 27 Nov 2017 07:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Kc9LUV1/uXNKNX7gDCefMeYvaGDod+m9D/bT+JW4tHE=;
 b=F0HyuNH4chTHMNj0ch5qlk5oJwYPaUCLcVVrDNtzSeSYuSBiJ0zwIOcdD2a4Inha8C
 RfaKQQoHJE5MB1L8hSOtroudNM2QH3P+zDcML4V3MIeGka8TCtJoSCqeXpdzkJ1h54Xs
 5W2/1Sq3Vunx8afFtIXFALPZv9t5J28EdpNNNfjIa82YeisIn/I3lmna/Z0Z6B+0hHud
 xC5h740bhNndzsnEpcCC2dGqSNA4MMTGe48ZVTZO2QVy/mBRtlo1BmdewD6xVJ/r/yf6
 GlaZS4EH8n4ZUv0RqiGjl8GfSQsLnRyDvUXhoUMFkA3Vz0vQRKXKx2kobB70KaxyiO9o
 Fidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Kc9LUV1/uXNKNX7gDCefMeYvaGDod+m9D/bT+JW4tHE=;
 b=Bo3gqgujg3nLATX3pQ2mRN9ljkS48l4iFjVK1qXzeT9uMVEoM6dYTWG5XnZhfs0z+E
 PhpA8hqm+xyY5xZXptH/n7vIImJjdysIqWbxy9+R33cjbxA5Efo0y9L4bYIGtBPM4oJQ
 /AA1cyJEaKb3fzqfri1fXBHSXUf9vEcxRewP6yiISLCxSBrDtfVNQdgzp4ienkfb+Pcx
 rgiMSEI4gcmXarBt58gEUOBRmXQ+MvwDqFfMWF4cGxDJ1eMq6w4xKOeHeKSjehw9Hfb6
 zHKqhiabAdFQ+ze7ozSvijCED6/KtbwShY3WJKypCd2NinC8+uJ6Lv0ofvX05GfTzWQw
 fqJQ==
X-Gm-Message-State: AJaThX60z9ujlidc0E09SNz1vFSbxnXQFqdYA5e5qSVhZaO7NLtjJgSd
 26Ekv/wTKaWZE83vjZQ8/Gdn9t8/7oUqVewQn3ZFZqjo
X-Google-Smtp-Source: AGs4zMaLvjtqPaplFw99mJJ62gLzAjRU3zqr/h9R1hQG13oDh4OBMBzTJPK+VSNBzIWHkoA3/KLCClYTs/43wnbNH4s=
X-Received: by 10.31.3.36 with SMTP id 36mr26146925vkd.146.1511796194319; Mon,
 27 Nov 2017 07:23:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.94.150 with HTTP; Mon, 27 Nov 2017 07:22:53 -0800 (PST)
From: Patrick Venture <venture@google.com>
Date: Mon, 27 Nov 2017 07:22:53 -0800
Message-ID: <CAO=notyW=x_9j45SDd-75WULwXQdTHhUx65R7YUUSgaBp2+qgQ@mail.gmail.com>
Subject: Linux 4-10 v 4.13 patching
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Nov 2017 15:23:18 -0000

I'm sorry as I probably missed the email, should I send patches
against linux 4.10 or 4.13 or both?

Thanks,
Patrick
