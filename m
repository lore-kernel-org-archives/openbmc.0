Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xPNMX1wKbzDqJ0
 for <openbmc@lists.ozlabs.org>; Sat,  5 Aug 2017 09:25:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Jwv5rvKl"; 
 dkim-atps=neutral
Received: by mail-qk0-x231.google.com with SMTP id d136so17010248qkg.3
 for <openbmc@lists.ozlabs.org>; Fri, 04 Aug 2017 16:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MpQDqk62j9Y/VRBZLwD58rcy4C8J8s0aug0Yo45e6qQ=;
 b=Jwv5rvKlAS/IE2BEt9BHsM+8j8XJ4N+TG/DG9+ylQqwh9D8k0RMUfD6hC84ae1nZ6U
 rgEd8xGGsrbu5cCRtdOtHZiUn5Nlmt7ZaC4Jc0OAKymYiuOXLfYgN7gAfuxSizRv9krw
 iNkagnBTvLDndKnF1Mc8WDk+PF2f7PQciC2zBtUYOCCdeWoAD5HZ2cdY5pgysNfFTPyT
 QIAiFsbA3cFGG59mJU88TW5etWHb6KHk7vFisHMscSVeSzyJI+w4a8mRJH2vy8IP4zKV
 cIrRhbSRcSywpKoB8pYo3ePw/MIzCegSwo8F7o08aeMk55Dy6G24IEccgQ4liHE6dM3j
 bQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MpQDqk62j9Y/VRBZLwD58rcy4C8J8s0aug0Yo45e6qQ=;
 b=Ul3LO0M4aTDw0LF6XATxFj8/8X68nEpOdbdEG+5UbrKe2YXUSWbbPZCzCkaoaQfjCW
 8dHt7+z/9pVdaTPDMTXssvERxVQwsbRfGH0llLSTwYGAxsomCOSS3wlZSH8pDXXh7HB/
 8VZ/4wDfqyF8ZMQRc8gHKY9yAhNASlaJHR2ceQltWMIk2wbyF4VThWnn48N4y7EmbM85
 Qqkv//fePBLrT0jQ/dSNYNBD2alkznklRdz44I8FSByYsEXjnMJEoLYl5tVID2tij+4p
 xjGV7sI5JgPVxvSr4CyuJF/QIUkVRyT9PyiyWzEYkhE10/zs2P7BfEA1LI3p9Tzh5/wk
 Q6XQ==
X-Gm-Message-State: AHYfb5g3gmoBnqJnp0M1z2qxu4SZqm26gMkEPZv6v0Siq0p5MKzztpGr
 oyceqA0xZgDH3YWN+eAXwvTtYxIS1J9w
X-Received: by 10.55.105.135 with SMTP id e129mr4966481qkc.317.1501889141404; 
 Fri, 04 Aug 2017 16:25:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.61.130 with HTTP; Fri, 4 Aug 2017 16:25:40 -0700 (PDT)
In-Reply-To: <20170804231854.19730-1-brendanhiggins@google.com>
References: <20170804231854.19730-1-brendanhiggins@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 4 Aug 2017 16:25:40 -0700
Message-ID: <CAFd5g45K3jK+pADuMy3vPDZgKx2vV66VJiCQrTp4koYBsSR05A@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] ipmi: bt-i2c: added IPMI Block Transfer over I2C
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg KH <gregkh@linuxfoundation.org>, Corey Minyard <minyard@acm.org>, 
 Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-doc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, 
 openipmi-developer@lists.sourceforge.net, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 04 Aug 2017 23:25:44 -0000

On Fri, Aug 4, 2017 at 4:18 PM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> This patchset introduces IPMI Block Transfer over I2C (BT-I2C), which has the
> same semantics as IPMI Block Transfer except it done over I2C.
>
> The documentation discusses the reason for this in greater detail, suffice it to
> say SSIF cannot be correctly implemented on some naive I2C devices. There are
> some additional reasons why we don't like SSIF, but those are again covered in
> the documentation for all those who are interested.
>
> In addition, since I am adding both host side and BMC side support, I figured
> that now is a good time to resolve the problem of where to put BMC side IPMI
> drivers; right now we have it (there is only one) in drivers/char/ipmi/ with the
> rest of the host side IPMI drivers, but I think it makes sense to put all of the
> host side IPMI drivers in one directory and all of the BMC side drivers in
> another, preferably in a way that does not effect all of the current OpenIPMI
> users. I have not created a MAINTAINERS entry for the new directory yet, as I
> figured there might be some discussion to be had about it.
>
> I have tested this patchset on the Aspeed 2500 EVB.

I forgot to mention, for the OpenBMC people, this is based on an RFC:
https://lists.ozlabs.org/pipermail/openbmc/2016-September/004505.html
