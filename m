Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMkkm4KXhzDvgf
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 21:05:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="d7Xul4ti"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id f201so17599609oib.0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 02:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=/p44zKEg51H5w0Z+nmmUj/OAosXoAJwzHb+B2Qhbn1I=;
 b=d7Xul4tiN57WOEO6MNfm69CL5gX15Wg0uKqjurbLlUIOwnsPZfwXgUdMatrh6gUzyy
 p0YEjJNWjAE8Q6u646IJVXkQzOtIO70MkDcsFtiASB686LiZSNHYnkOTgrxJqYA66cQR
 mRoLJK+Ao8R1kjDK2PSsOkkdTqi8L+bDPQlN2pwqNkbn8maryEqesCbOs8Aa7+CGb/MM
 TDUeIZAmHxFZJagSYyDBfSNNpMsdm05qhfTBKZrDBmNy9wlvuloPD2SFUBAtymXpOay3
 gjLIRgNtGHrPZuWxDL07hXZteuSsn69xI9A+JrC5BO/DWOXAPIYmrdVXrq9XRIsb+1q8
 2VeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=/p44zKEg51H5w0Z+nmmUj/OAosXoAJwzHb+B2Qhbn1I=;
 b=H6wB+9Myda65p6zGAtg2Gl28xV1nzZDuQG8vWCBHMFf6MTYoxDAI3oUR4NnFCPgRUs
 Xup2nXnxfdMAUQEUIb2s0tSmVaau/MHSkGoFcgvunIZ2FcLFCWqIFGOoSPemeRZpjmnQ
 H+7at+0NW1aw/Rl9sQOZ+rP8rXnp3QzMupOtu1ZjxHg0sc4btAczt5HQAL6IfL5ghQpP
 Fn4d8fOgjjExMl9L8r0CJ8B/rplwFZ7Jefr3aX7c8CIDbx9Wd0C5LO3Lczj1aZ8TOg0s
 +/THeBzByz71Rlfoa9QZah95yvl87+m0C1D1Icnh+lz3TBg6+nWXjZmjKpc3WwLv2xsm
 YMmw==
X-Gm-Message-State: AKaTC01mBCFA7inRa021paxfSt9eixrCnh+nRUsrXI9z8wIUOXIj6WWhRnzQu6SUWesyMx8I+poMZNBNkvxWLQ==
X-Received: by 10.157.63.199 with SMTP id i7mr8954097ote.63.1479722750745;
 Mon, 21 Nov 2016 02:05:50 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Mon, 21 Nov 2016 02:05:30 -0800 (PST)
In-Reply-To: <1e600e7b-9724-64cc-6446-5b8af4eaf654@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-12-git-send-email-clg@kaod.org>
 <CACPK8Xeo7f9rJ9JdR9GGYtfPFu67ONEZKK8V6xq9+hRSuEvc=g@mail.gmail.com>
 <1e600e7b-9724-64cc-6446-5b8af4eaf654@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 20:35:30 +1030
X-Google-Sender-Auth: i2WEp1qqpRamlSBQbEoUCn3AYMw
Message-ID: <CACPK8Xeggc+OQRBS8fOCHUdODFxn_kehKdg7jQ9kA+hqKc8eGA@mail.gmail.com>
Subject: Re: [PATCH qemu 11/38] aspeed/smc: get the number of flash modules
 from hw strapping
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
X-List-Received-Date: Mon, 21 Nov 2016 10:05:53 -0000

On Mon, Nov 21, 2016 at 8:29 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 11/21/2016 08:26 AM, Joel Stanley wrote:
>> On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> w=
rote:
>>> If the second watchdog is activated, a second flash module is
>>> available. It should be of the same model.
>>>
>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>
>> Nice. We should enable WDT2 in u-boot and the device tree for ast2500 sy=
stems.
>
> Yes. I think we have ~20s to deactivate it before the system is reseted
> to boot on CS1.

I opened this ticket for us to track the work:

 https://github.com/openbmc/openbmc/issues/822

Cheers,

Joel
