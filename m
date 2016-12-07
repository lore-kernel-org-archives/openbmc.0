Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com
 [IPv6:2607:f8b0:400c:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tYvg01DSmzDw1d
 for <openbmc@lists.ozlabs.org>; Thu,  8 Dec 2016 10:22:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ReGI9yE5"; 
 dkim-atps=neutral
Received: by mail-vk0-x22d.google.com with SMTP id p9so220817213vkd.3
 for <openbmc@lists.ozlabs.org>; Wed, 07 Dec 2016 15:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=RCBCYl94/p9rXVLeXSPX5PQtah0lOi3yshLijBwkB60=;
 b=ReGI9yE5u7yKQ/RsvcRnjh+YGNNbUhJCbtO29rIekmtb0Bxe96vHAfLmoJaZsPDF2V
 01a1nvH5wltnAn1pfxYjuZUOlRZzKPNDyQ9thIE2Bp1kvw7KD+vAxkORLfqXSl/syHxV
 rt9xI5f8VoR9AJWV67rbuM4OmL1gqgn+XrR62INFoTRCYP1wFSebWpyOhgKRm6B15Jp0
 Mfd8JpMtyZbtAKwLBM6r8jFSmfoQhtAhaSL+7reFY0wa1LY7mPe3ktfYyOqHP3laqbz/
 gEaL3yrVFS6HI8w20LYx1U8mey3YzACSJAZLKWKMSpMzfr40wttW2cbd7pvUsm1b79fN
 yovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=RCBCYl94/p9rXVLeXSPX5PQtah0lOi3yshLijBwkB60=;
 b=Yj9q33dOCAIoUp70eWV01f5EDzd/n8jGEqWDKMgmp7hs4cEZhBTUQhJ1YeZknqCb+Q
 C0jaUcKm2lRjJ/JbJyTqadvykKD17y+4M5JnyaulQrrGmxwRV0+qs/UfWsmEUSifOKds
 pjumSfV+MBJ44N+t/aTTSmSoBO6qsCOwJgOGHRI60EsSz/+QMWSFatpVvrgasnGDOY/g
 gJGHk8qPXOQe5Kicn7nhY3u29qZZ6PzlQtisO0wGDmSGxpSVjSh2IaxJ0BX5g0LkBWR4
 mbZh5KuZKQAvWZaP+icJ22wGTKkXOr4iOjIsrLBAKDQlQj4U7Q/62lE4lezYVAvywEJa
 d8Yw==
X-Gm-Message-State: AKaTC00v5UqwZrWc28WcO+WYqnpc6bVs15z2r3/wHsqM9nSXqKTLUyScp6MC2stwYpTxYdxzhpabq8xFAZKQag==
X-Received: by 10.31.130.20 with SMTP id e20mr22626366vkd.149.1481152969989;
 Wed, 07 Dec 2016 15:22:49 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.48.91 with HTTP; Wed, 7 Dec 2016 15:22:29 -0800 (PST)
In-Reply-To: <5483e4dc-506b-c5b1-8e62-17408a9c1d9c@kaod.org>
References: <1481133996-29973-1-git-send-email-raltherr@google.com>
 <1481133996-29973-4-git-send-email-raltherr@google.com>
 <5483e4dc-506b-c5b1-8e62-17408a9c1d9c@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Dec 2016 09:52:29 +1030
X-Google-Sender-Auth: z_6_Q9ejsDONUZya-d7qeTllEbo
Message-ID: <CACPK8XcpR534r0nr06TQxr9hyM-_CY5SAFLO15-5yqO+zYsu1A@mail.gmail.com>
Subject: Re: [PATCH u-boot][PATCH v4 3/3] Enable FIT image support and FDT
 loading for AST2400/AST2500
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Rick Altherr <raltherr@google.com>,
 OpenBMC Mailing List <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Wed, 07 Dec 2016 23:22:52 -0000

On Thu, Dec 8, 2016 at 4:54 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:

>> +CONFIG_EFI_LOADER=3Dn
>> +CONFIG_FIT=3Dy
>> +CONFIG_FIT_VERBOSE=3Dy

Are we sure we want verbose to be enabled?

Cheers,

Joel
