Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgCC2vbKzDvk1
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:26:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cmP0Iwg5"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id u15so1447391oie.3
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=1XLgRqfRlOj7RvCDp7YdoOfVD5KzDBVweUEkCzK7xX4=;
 b=cmP0Iwg5QuCPNXrPDRXMcitjG4Ye4xuJxvZFyflwOjJnCPwALWBvNgM6gNKPlsMDmP
 Co3cNyrtwYT1i3Hmgz7FM2FUd5a7ASIXhvxa7IKdFfCl2j7KPvF+mCQIBwX+0ZW0Drxc
 m2Kl9Y0QL/pu+OAqiUUnQaA81VLtiYxo5ZHKoRARrirYmOiPA8Qt8a96XaaD+MyfSLmJ
 BFJQeLnXjTJMXCTxn+ZHx/9L6X9cmy5i8KB2psut43bU33GzhTOxcp3PEU2Y7Ci5M5d7
 eYXf4/Z+VxMdGjP1yAiUYTV+BQyjD9oklMQevD73YOzRHVWiJnsGsRK31ubwV0LiDDz8
 ijCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=1XLgRqfRlOj7RvCDp7YdoOfVD5KzDBVweUEkCzK7xX4=;
 b=kAD1k8A6lOrjOyfnJ1pPCbTFHR/F0ZsBcPlujNrYmce4O6aZoQaRsWmuX53r2N8ACF
 pWlHinPtycNxKIA8SWf1AgasIgccUZboXltFH4NiZXmPamkifHYRRICwToN8VdJ8OYL2
 qe7NfaZixToKEXgevRlKfP/GlfN3qaDDqOEQCibOaV7ydYaSASUIs0L/MRbixbEw16Ji
 CZYMHGIf7BXvsA7tBPzsnJOCCambgrFvZm2y8igz+2eWqdXXXDXWR+BqnYkL91Onc5f9
 iy8y6xEXDA0e0UD0nWUqi5ZMFkEPdsPF0tjA2ZJ9RtNSmJZc0i6trGmru5YN/74PJKmr
 4J4A==
X-Gm-Message-State: AKaTC02oVQ+XTTVNRmYFjun3hTqNawmJpSNbQ0WtDgD4LfLUk5p9QCAFOD73i/m4Bg5iqlFYqaW3OiMnmcedgA==
X-Received: by 10.202.0.205 with SMTP id 196mr7833718oia.44.1479713205702;
 Sun, 20 Nov 2016 23:26:45 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:26:25 -0800 (PST)
In-Reply-To: <1479478938-13267-38-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-38-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:56:25 +1030
X-Google-Sender-Auth: 9mDxM0bSZRzF3wzHT_6I-CWwLLg
Message-ID: <CACPK8Xd=9AtdSFDbxaOWXAjYBwOVYN1xDEDNcwyM42uarQXP1A@mail.gmail.com>
Subject: Re: [PATCH qemu 37/38] slirp: add a fake NCSI backend
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 21 Nov 2016 07:26:47 -0000

On Sat, Nov 19, 2016 at 12:52 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> This only reverses the NCSI packets to make the Linux driver happy.
>
> The NCSI header file <ncsi-pkt.h> comes from Linux.

It's changed a tad, can you please grab the latest version from upstream?

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  include/net/eth.h   |   1 +
>  slirp/Makefile.objs |   2 +-
>  slirp/ncsi-pkt.h    | 394 ++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  slirp/ncsi.c        |  95 +++++++++++++
>  slirp/slirp.c       |   4 +
>  slirp/slirp.h       |   3 +
>  6 files changed, 498 insertions(+), 1 deletion(-)
>  create mode 100644 slirp/ncsi-pkt.h
>  create mode 100644 slirp/ncsi.c
