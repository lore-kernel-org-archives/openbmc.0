Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::236; helo=mail-lf0-x236.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rcQRLSQ+"; 
 dkim-atps=neutral
Received: from mail-lf0-x236.google.com (mail-lf0-x236.google.com
 [IPv6:2a00:1450:4010:c07::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yrzD93BGTzDrqP
 for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2017 10:56:24 +1100 (AEDT)
Received: by mail-lf0-x236.google.com with SMTP id j124so2298015lfg.2
 for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2017 15:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=0PwFO6H4HssX4W1l/wEO+jxBDKNhmSrIWh/m6vkMm2U=;
 b=rcQRLSQ+i92CJVfpnmqGcmDgRpJPvyBzuOvSt7v7wLOOqFchv8JDClEu/zAhrmJPk7
 b/6yZFfPPPZ1MnOx7YbNrsznsh6jWrQuzH+qBBkWcN5kTkULJDwJ0sOL88YCdVm3jsjS
 XGAUGd+XEq6xsxzvFynkYy3VWgNRKCv3rJi6wjOSOGvTwfidtyl/NftY5dvbuCrKylTx
 jzcMTmbrDfR1v+nDOyc/kGlV3OD4ETnm2UmgHQTtjhubFuJVS1KCMZYwl0ZfCAII90W9
 pvstjdcx4iPDTnHrSjFn+ABQT6RsE49RoKkXyipnkLHwIRBTHiRJPDKYxLjOj9FHPFiL
 q1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=0PwFO6H4HssX4W1l/wEO+jxBDKNhmSrIWh/m6vkMm2U=;
 b=nd5fHmP31E4Ir3huLDpt54bV86z5/ThOInlh6opIQGVWJVdHgE42A7IT2vsLPdgvQZ
 fOBX7gPKZ376p/9yJU+DY1qgp3R8ZaCi0d39pi97vuwWpi3GIdMTGP59tSLoCpuRRtGl
 gcwwgaCkkR0XbKqqPBNBORYOGD9+1ZiWbIb3/yGSLN46AzHU5WreAbIM9Is4LWDsK5Mb
 PqaOWXQ79qAshwGTHrah780bPHH9J1H3f+au5roKFU1Vc1BA/+L4YpmWijMIripQTNVa
 0CO9I3g4biqpfEBzTA5Z0WHB9Qc+OwDoVweV3LepfRZGsAu59Q2QwRrpVVZw+gLn6xjC
 jD8Q==
X-Gm-Message-State: AJaThX5BWeetgkYnSvGEmWaF9ArmgtbOK3zXkuYGg5hGQs41xueJpUp0
 Fp3vWEFMYn0QPKOBo1cs1s94w+GCMh+CVx+QqPU=
X-Google-Smtp-Source: AGs4zMaxj1Ijqtduqc1vnpsw5DYTmZu2Rz4B3/ponAqTU9cR6qLYP9fm+r8hSuFaaJPlENbpcZJhAOnEAhp1//j1QNk=
X-Received: by 10.46.17.153 with SMTP id 25mr12194740ljr.36.1512518180903;
 Tue, 05 Dec 2017 15:56:20 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Tue, 5 Dec 2017 15:56:00 -0800 (PST)
In-Reply-To: <20171205213900.165038-1-venture@google.com>
References: <20171205213900.165038-1-venture@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Dec 2017 10:26:00 +1030
X-Google-Sender-Auth: mIAgNz2GscQ-oFEzFebsSM-2PrI
Message-ID: <CACPK8XfsHM9496pMv-s+CvrTYx80iS0049WBNyJNxHR14Yv6xw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: quanta-q71l: move coin
 battery sensor
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 05 Dec 2017 23:56:26 -0000

On Wed, Dec 6, 2017 at 8:09 AM, Patrick Venture <venture@google.com> wrote:
> Moved the coin battery sensor into a separate iio-hwmon
> instance to facilitate reading it as a separate hwmon instance.

Have you considered adding some some #defines for the ADC channel
numbers, to document what they do? It doesn't appear to be a common
thing in other dts files, but it makes sense to me.

I've applied this to dev-4.10.

Cheers,

Joel
