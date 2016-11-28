Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tRvyB0W5yzDqhX
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 16:15:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="v/s2qAD7"; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id x186so4411770vkd.2
 for <openbmc@lists.ozlabs.org>; Sun, 27 Nov 2016 21:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=2CAkG94kYlzrFCoQ+T9b8ygBD5AcfAFq3CH5E87J+fM=;
 b=v/s2qAD7aI/JW98kPdCcBJscg56b0xrHyHbfITq/t8vcIRis2JfVp2SbO8Zz9T3Ijc
 7ZFRp6PKZRbP+kA+fOt/QftoSQxVws2DnysO7BdKDHfwL7H/5Qzz9zR/DCxj8ra5cARb
 vUd9cxJe6jhvdyOzGq4XM5OYyGZT8lSpmuKIX/MSuJK7MDAs5jpjz86u9tBr+mhnNZPt
 xmEFa7Q63JfOg0aJYytp1KS6vZ7vt8su3QDQ8dEUqZznD4EPhMT55QR/1zXWdSHrlfLK
 dpd1jfFZs5fx8GAL5sNm7og7j7QcDpBl/mZ88khT5R1gbJ0UTPiKxuY4ERds1buczHzk
 KV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=2CAkG94kYlzrFCoQ+T9b8ygBD5AcfAFq3CH5E87J+fM=;
 b=RDzhIr9U1zYi4iEfaRh4sZ+AoQQ/Vki4Pzhk49RhvCtkFPmaWmkIqNlFv77M9ukgKO
 7J9FLcW72AOq8uHkI3ONcWREC2UW1ua0RhuCni53/D0R+PMmk7eCS49bUDRjwPAawviz
 8H/Fa7NI/a5ZHIW5nBO0Bk65izVLGe2jdTOHFVE6E/tTL66M9I58bbHxM3YH/DpBkEz1
 MDOMc3fSrZbAG4OCWfWGC2ShUZUCaJHye25wCWkZpTQBco5MgtrzymPDU5rR2fKeXF3D
 1+HB+AOVRkjsQMVfOsofAB83jDlNwZCd100JW17FrqZK3MlnwpMrIG17HRDIXGxYZAQ3
 bk/A==
X-Gm-Message-State: AKaTC00E0NjfjEuTq57Aa8w4D6KLXM3gefWLi6IUjcGtrbqYhpmtLRcJlaVzKLgwWAlkatKNkGc8yko0LFbfWQ==
X-Received: by 10.31.223.68 with SMTP id w65mr6854677vkg.124.1480310111416;
 Sun, 27 Nov 2016 21:15:11 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.0.193 with HTTP; Sun, 27 Nov 2016 21:14:51 -0800 (PST)
In-Reply-To: <CANsWYUWKOxifT=6bZqLu7yh_H8EnQ=m+50Mvyr15wBtk_qL=Jw@mail.gmail.com>
References: <1478657505-23109-1-git-send-email-jaghu@google.com>
 <1478657505-23109-3-git-send-email-jaghu@google.com>
 <CACPK8XfyNvU2ALoGBc9k6xnB83mFaLdLRpG5pe1DOmbX08Jvew@mail.gmail.com>
 <CANsWYUWKOxifT=6bZqLu7yh_H8EnQ=m+50Mvyr15wBtk_qL=Jw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Nov 2016 15:44:51 +1030
X-Google-Sender-Auth: 4F3MdKahBQbqaHJ9u_uITIN05Dc
Message-ID: <CACPK8XdRTSMCO7s6T68bWpt8WQbC3DB39Ea48h7xopi0Y39yTA@mail.gmail.com>
Subject: Re: [PATCH linux v2 2/3] drivers: hwmon: ASPEED AST2500 PWM driver
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 28 Nov 2016 05:15:15 -0000

On Thu, Nov 24, 2016 at 7:56 PM, Jaghathiswari Rankappagounder
Natarajan <jaghu@google.com> wrote:
>
>
> On Tue, Nov 8, 2016 at 11:15 PM, Joel Stanley <joel@jms.id.au> wrote:
>>
>> Hello Jaghu,
>>
>> On Wed, Nov 9, 2016 at 12:41 PM, Jaghathiswari Rankappagounder
>> Natarajan <jaghu@google.com> wrote:
>> > The ASPEED AST2500 PWM controller can support upto 8 PWM output ports.
>>
>> I noticed that the ast2500 and ast2400 share the same PWM IP, so we
>> can use the same driver for both. You should reflect this in the
>> naming of the Kconfig, filename, commit message and the code itself.
>>
>> > There are three different PWM sources(types M, N and O)
>> > and each PWM output port can be assigned a particular PWM source.
>> > There is a sysfs file through which the user can control
>> > the duty cycle of a particular PWM port. The duty cycle can range from 0
>> > to
>> > 100 percent.
>>
>> Can you explain why this is a hwmon driver and not a pwm driver?
>
> The fan tacho controller shares some common registers with PWM
> controller; the fan tacho controller needs to be a hwmon driver; so if PWM
> controller driver is a hwmon driver, then there is flexibility to add fan
> tacho controller functionality to the same PWM driver and make it as common
> driver for PWM and fan tacho controller.
> The duty_cycle value available in pwm  sysfs interface needs to be
> configured in nano seconds and the duty_cycle value available in hwmon sysfs
> interface can be configured with a integer value (ranging from 0 to 255;
> with 255 being 100 percent). So thought that hwmon sysfs interface is
> easier.

Okay. Make sure you include this information in your cover letter and
the commit message for the driver.
