Return-Path: <geissonator@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::229; helo=mail-oi0-x229.google.com;
 envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GCxYt0Gl"; 
 dkim-atps=neutral
Received: from mail-oi0-x229.google.com (mail-oi0-x229.google.com
 [IPv6:2607:f8b0:4003:c06::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Trf02VBXzF35T
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 03:54:47 +1000 (AEST)
Received: by mail-oi0-x229.google.com with SMTP id l10-v6so29753238oii.0
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jul 2018 10:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=JeELjXv753t9wOZZ8R1Xpe4knUdwsdyM4fb86VQx+no=;
 b=GCxYt0Gl6GrmGB7MTECMx4ZVrAoOKEOuRB1cOQS1r5l79VPJLw16sifipqi9Aklvv2
 abTqgBiE+2qBQivMfEbC0Ii/oZ4q0aQW/W40IwtVC8qoPts/nWETV+E/ofqNEzrwWR9A
 vOSWw1bL8JmQvFC5l8YMuFu6//V9WaFzboqWgDU/thVOKozbm1gACm4kWvvj1OO2BdFx
 qnljAacidaP9PmSY3cLZawaU0VR4HV+iTBJUQL4Fb182X0H3+iq4vnNtRNCaQzsSXpgI
 1EdTZGgsrLO7LyA9L7rzhAUPy7D14ZiZfpZ3+JQklm8sqG8rHy2rpOWifHMIVlBsYKw4
 PROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=JeELjXv753t9wOZZ8R1Xpe4knUdwsdyM4fb86VQx+no=;
 b=CjKbn5oGMc0F7+v0nLN7tE/mpxcvI7Jj4CuPebLMW94J6zzqu2k1chwuUcB0VDOUQJ
 KXeWdd0cI+4ZdtmoGX86Ne4KktIqVzJkHJrbP4urnOzg30Zdm9JJcR9SFHEViaUlsENu
 xetbUIptDCRiv+JUXE131017IPGmX/O68Ti6QePCw8dAeDoxfuL0GiQ4sAwDq8NXJC4q
 QCSWuCkfeCr733Mgc0yHf1yjCbH5LlXRlAV1pEMXEQ3Cb1YXLVibNLa+DZd7RiscGvKo
 gBbe8ebjZ+1t3GdanqQl8fThl2ZKyn+Dt6DfeoHnI8c5fWqKDvBA4YQ72VsN55TMFyRI
 h0+Q==
X-Gm-Message-State: AOUpUlFNzal9b+vF6fPv/50g3v32gcXtpZShiX90pI6BeSXnI7XMDQq6
 prc8gnM27NRF/RTJ5zGJcrPBBFpnw8f1UdBYxVaKKw==
X-Google-Smtp-Source: AAOMgpe5jngylsQc2Dj60T8tRTfIK1BKG+VDkDtaBoh8qsz7bIQ2XkxPmBLJ08QHIYYzCD6KjoXXfETNtDzrucMSt5Y=
X-Received: by 2002:aca:401:: with SMTP id 1-v6mr402943oie.28.1531763685023;
 Mon, 16 Jul 2018 10:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <CALLMt=o8yNPgjuvC_gDhqVR5TrrdA5pszi+vMmAmATGmZC1w6Q@mail.gmail.com>
In-Reply-To: <CALLMt=o8yNPgjuvC_gDhqVR5TrrdA5pszi+vMmAmATGmZC1w6Q@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 16 Jul 2018 12:54:34 -0500
Message-ID: <CALLMt=rc3WSZGBjKJ=7jfUfi8i6hjVVQ92nOg9UH67RmxcoRHg@mail.gmail.com>
Subject: Fwd: gerrit server update coming - 2.15.2
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 16 Jul 2018 17:54:49 -0000

This update has been done.  See
https://www.gerritcodereview.com/releases/2.15.md#Release-Highlights
for some new features.

Let me know if you run into any issues.

Andrew

---------- Forwarded message ---------
From: Andrew Geissler <geissonator@gmail.com>
Date: Tue, Jul 10, 2018 at 3:13 PM
Subject: gerrit server update coming - 2.15.2
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>


I'm planning a gerrit update in the near future (this Saturday
maybe?).  Anyone have any issues with an update (or know of any issues
with the 2.15 release)?

Andrew
