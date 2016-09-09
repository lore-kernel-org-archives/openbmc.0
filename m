Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x231.google.com (mail-vk0-x231.google.com
 [IPv6:2607:f8b0:400c:c05::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sVlvj1zynzDrHp
 for <openbmc@lists.ozlabs.org>; Fri,  9 Sep 2016 15:22:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=viRTUbAO; 
 dkim-atps=neutral
Received: by mail-vk0-x231.google.com with SMTP id m62so5637691vkd.3
 for <openbmc@lists.ozlabs.org>; Thu, 08 Sep 2016 22:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ZfeW6N5C99xwpyqqjLWc7nyi7r//b0KpCBrUXvA7wws=;
 b=viRTUbAOGMRsVX05KCmcuCucoyMfx6/hiF1pO5aXiiY1XZYBAi//Q+3BuU3LsLEXqO
 QIJHcyi0IQ8guBUgiEQk45JGL1Vxo4MHe4hdbuvFeKG8V7PCi6iZSKWWCmdRBiLDgpTt
 OARPOXdbIak4d5w6DCxlB8mpbFovMxQXJEVpQUgyhJdmIT4oIsVqVXX5VkhgteFpbbJh
 acQfnWB9S2X7/BSvlaBUlJFm5Ee8rDp0VaS6plR0y06eZ8oV1NmioPrSATVuP3ffy71O
 4pI28uCt2KaAF2BN2qPhT8D+u3c5pjnEOJE/GdwjzKOOZmlZV7qvZVBpb4f2Rqde5tx4
 bBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ZfeW6N5C99xwpyqqjLWc7nyi7r//b0KpCBrUXvA7wws=;
 b=Tr6l8FTKT3zD60Fy3L6ZNpUsJG8wXnQVMaUusGgKlCnbSHJSOi0LFn/qEqISCuV7w1
 R2AG6JWqTtMc4XKqZzB9F9UCbHKaIarVHCoZ+bPgUBmaItq+5ZvOgIHsMMh5Z/CbfXC6
 AJ1HcYCTWmI779P0Qq9tAMj86DT1dPg0sfaN1ZEqsd32bDlmRiUrt/u5CLDGSHaEwda9
 ebBBmMdFj5xZQTwbung4umOmtDbfa4YE+ik8ej4OU5fCobrshHlvSB9bse5tX/3igVrQ
 zBVosVq+Q0MqshhNIv/c2nH6/o+LmQgyWraqg1+qRkzn5JOW/7wPqlFQDAAwhZ7I5Ktu
 dRgw==
X-Gm-Message-State: AE9vXwOEdFIFSzxcMWQtEJ0d5QGRjclxsxSboHF0eHoMFrZ7mRn4+ctu6oqLC7dK3915GOjicPMOxKYhB8pdIw==
X-Received: by 10.31.146.10 with SMTP id u10mr1114473vkd.14.1473398558574;
 Thu, 08 Sep 2016 22:22:38 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.80.221 with HTTP; Thu, 8 Sep 2016 22:22:18 -0700 (PDT)
In-Reply-To: <1473370130-26681-1-git-send-email-brendanhiggins@google.com>
References: <1473370130-26681-1-git-send-email-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 9 Sep 2016 14:52:18 +0930
X-Google-Sender-Auth: ZglaiCdnN_RkOvpMHyyCQld1UyY
Message-ID: <CACPK8XfeS5obZguFmRPhw5OtvaSjmSnYvsxH45N743FZDE+y2w@mail.gmail.com>
Subject: Re: [RFC 0/2] misc: bt: added Block Transfer over I2C
To: Brendan Higgins <brendanhiggins@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Sep 2016 05:22:41 -0000

Hey Brendan,

On Fri, Sep 9, 2016 at 6:58 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Looking for feedback on my new bt-i2c (Block Transfer over I2C) interface.

Thanks for sending this out. You're setting a great example for the rest of us!

I don't have an specific feedback for you, other than to say I think
what you are doing is reasonable.

> I based the slave side (BMC) driver on the bt-host driver; the file system
> interface is fully compatible and has been tested with btbridged and ipmid
> running on an ast2500 evb.

This is timely. Cedric has recently sent out the bt-host patches[1].
One of the questions raised was the suitability of the userspace API
for other users. It would be useful for you to put forward your
thoughts on that discussion.

[1] http://www.spinics.net/lists/arm-kernel/msg527834.html

Cheers,

Joel
