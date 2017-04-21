Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w8Jh90z1TzDqKs
 for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2017 11:54:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qPjbTB7s"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id 203so7476877ywk.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 Apr 2017 18:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ODu/6c6floaHF6gT+im/wD8nTv9pWA0Aci4zs4G40iE=;
 b=qPjbTB7sVCW3CgHkPl0WSfH6OzwD5gzt8KvN6XL6PKOA2szcsUEX9OGdz8aE19aMGW
 JyhOAIhXSYxY5X0PfOqoObLW3QLIh6+m+r6C0KUj89xJsBR6CT3SxNJD7QZ6iyszOejt
 eUVsosrQpv2izosonSPTMjAAlMiZszZtkNzOhPGb0ZBadzcZ3Tu3pKOaPUAqCR5fND+O
 4qlqPPxxcLz+PTmnLD+kT8R+KucqfiUNRIeOeXBfEy132qlshYKFI6tlbYX7JeUQEyWf
 rX7DgIZsLqwJeXryt5kSXZJKJ/bhaMlazPnoQjjpgyTctuwQnjFN5L365QSn8hl29xfB
 yKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ODu/6c6floaHF6gT+im/wD8nTv9pWA0Aci4zs4G40iE=;
 b=TocVH1OZmWcEonZC9zUvSDqkqJUXEUCBMNUmjFWKjDk757gb4XagEPosfAzza44xoZ
 Hn86VGAS1w61Uw0Q5xgA4+rhVy9qkoTgaF2rkDXv112GlD5jcE25uIpBxhwYIwOXvUta
 sHMXFRQwGm3HiskmFY1fGAm37c5dVXyJPsrrwRi/831eGZ9+MFLztoiJRg8VbRNoubDq
 jNTPnqeEfjFgrcsn/IOdVKL2lXcKrI6BWN0h2s+flJMUR2nZoMnD8KDZjKJ2KdQv7N8g
 vy6zk6lTrFMSn5eoSDR8ij+SYromjBn3Fw2G/ckpB7PPI7slGHd1bQ21QTkmd88e+ax8
 nRmA==
X-Gm-Message-State: AN3rC/7V6PFM83hbnoJZOEGemy5WijZMcinensTsvRfyBx6h86ZMvmM1
 mbf7wx6hhDXAay65zPfQsmuYjXK68A==
X-Received: by 10.129.108.20 with SMTP id h20mr9091298ywc.50.1492739670905;
 Thu, 20 Apr 2017 18:54:30 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.8.202 with HTTP; Thu, 20 Apr 2017 18:54:10 -0700 (PDT)
In-Reply-To: <CALLMt=qKaXU5i3J+2wWFA968t4ohOPBcyjAnfBU0wW7NbROufA@mail.gmail.com>
References: <1492443705-24309-1-git-send-email-saqibkhan@utexas.edu>
 <CALLMt=qKaXU5i3J+2wWFA968t4ohOPBcyjAnfBU0wW7NbROufA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Apr 2017 11:24:10 +0930
X-Google-Sender-Auth: rVZvhtAFDu8qTRFZdD2F-au9Pxo
Message-ID: <CACPK8Xfg=b6Sf0ENtWGFkbdUNuTGVgiPTC+4KbhTJ5fcufGDvw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] Correct spelling of "barreleye"
To: Andrew Geissler <geissonator@gmail.com>
Cc: saqibkhan@utexas.edu, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Saqib Khan <khansa@us.ibm.com>
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
X-List-Received-Date: Fri, 21 Apr 2017 01:54:33 -0000

On Tue, Apr 18, 2017 at 11:12 AM, Andrew Geissler <geissonator@gmail.com> wrote:
> On Mon, Apr 17, 2017 at 10:41 AM,  <saqibkhan@utexas.edu> wrote:
>> From: Saqib Khan <khansa@us.ibm.com>
>>
>> Note:"barreleye" mispelled in /sys/firmware/devicetree/base/model
>>
>> Signed-off-by: Saqib Khan <khansa@us.ibm.com>

Thanks, applied to dev-4.7.

Cheers,

Joel

>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>> index 9dc3e67..f638bda 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts
>> @@ -4,7 +4,7 @@
>>  #include <dt-bindings/gpio/aspeed-gpio.h>
>>
>>  / {
>> -       model = "Barrelye BMC";
>> +       model = "Barreleye BMC";
>>         compatible = "rackspace,barreleye-bmc", "aspeed,ast2400";
>>
>>         aliases {
>> --
>> 1.8.2.2
>>
>
> Acked-by: Andrew Geissler <geissonator@gmail.com>
