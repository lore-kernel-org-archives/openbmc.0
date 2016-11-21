Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x22e.google.com (mail-oi0-x22e.google.com
 [IPv6:2607:f8b0:4003:c06::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMVLq70TGzDvfQ
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 11:47:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="zuOfQjPx"; 
 dkim-atps=neutral
Received: by mail-oi0-x22e.google.com with SMTP id b126so107389603oia.2
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 16:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=irk80pH86c6Bagglq2o3e7gC2bL162Ey/LlYk56xMxA=;
 b=zuOfQjPxfzZdlpX16MZEjU+UQnWEIPV5/FSYYtLYNnmcTu/YsnPLPxvVbh5NJ1Q52Y
 xNC0mUxhWUGWiQg1aG4UKnY3i1fUzjzCLwfmSECYo9/ZJ2XX/ive0yERFQzLDDCv4nsd
 JO/YXDxVZYcruc9Zxckp6+S00fUsudwFX0UyoSaGPFgfQsLTOD+VlE8zvGNKMEmlFz6V
 6eufTjC0g3TV5gzxNINiBDw1GW3hBTUJhIG/x61sL7HsJkLn41ot2Q3KnLFiXlpW63cg
 Y98dCR0a/+OQKWdnjT1CsAeIh9v4RMuHUv0Qd3FBZoVfDY4r1qJcAEp1JAzdLeMFV5NH
 0uMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=irk80pH86c6Bagglq2o3e7gC2bL162Ey/LlYk56xMxA=;
 b=TlM02SOqXx/0tr/2pH8wLzDF1ixrTXxC02Hc7/Qy+7Lr5bFRLeH+8SVa66O1OOdFEG
 i6S9dlw0/fR8SLvkgggnHhI6sxhrzr9ox2eo4XkRSutpEhHL1QF4tAnE4hzdZvg8ky5M
 BNrWct8rqXNgluMfiw6d6diXjGBMG8Za2O/CJnoRE++ZgfCYequOCMNlhm0rfAIwNq6d
 OBUv11ZjAcz1KBY992rmgP+SqfncT+cPTMfxocgWrfppdMs6ncsgzcWAU1+vtZCq7gmE
 Dq0EcF4Yoz/w0xWQfX36h6wC1Bp6GK8Wk7moZsxhlY7IqI/2NbCEbvckM2kMY/VUDcoF
 +Iww==
X-Gm-Message-State: AKaTC03+oGOZX0BCBiN7hcaPoJpP3IMTmYlAwurAC6l3B+GIj5BlHv81QWNEPoaoZ2BT6JHTD6reqFotj/VFRg==
X-Received: by 10.157.17.26 with SMTP id g26mr6637746ote.230.1479689265731;
 Sun, 20 Nov 2016 16:47:45 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 16:47:25 -0800 (PST)
In-Reply-To: <CALLMt=oTDrjn5BsFpxfiJX=AKN65_dqWi=bQMswunbwaNxe_0g@mail.gmail.com>
References: <CALLMt=oTDrjn5BsFpxfiJX=AKN65_dqWi=bQMswunbwaNxe_0g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 11:17:25 +1030
X-Google-Sender-Auth: pDNB6U0gF-aoV5WmciiYUz4oEZo
Message-ID: <CACPK8Xd10-XSAsqBGhyaKQYfA0YLNZ00qFuW_ocASkXZA=qd_Q@mail.gmail.com>
Subject: Re: Jenkins job for per-repository CI
To: msbarth <msbarth@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 21 Nov 2016 00:47:48 -0000

Hi Matt,

You need to set your username in Thunderbird. I also recommend not top
posting and disabling HTML mail when sending to mailing lists.

On Sat, Nov 19, 2016 at 8:09 AM, Andrew Geissler <geissonator@gmail.com> wrote:
> Matt Barth is working a story to use his new auto tools capabilities
> in each of our repo's to do "make check" calls when code is committed.

Cool! I assume make check will be used by developers on the local
machines too. I think it's important that our development process is
as frictionaless as possible. To that end, someone should be able to
git clone && autoreconf && ./configure && make check wherever
possible.

This is harder for projects that have cross-project dependencies. How
are you handling these cases?

Do you have any code for us to look at?

Cheers,

Joel
