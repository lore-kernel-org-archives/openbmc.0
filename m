Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sP2sR4y2VzDrhs
 for <openbmc@lists.ozlabs.org>; Wed, 31 Aug 2016 08:15:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=PAKR2DNY; 
 dkim-atps=neutral
Received: by mail-ua0-x244.google.com with SMTP id 76so1739559uak.0
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 15:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qZQS5Ak1LtthH+ZrIJ16uurwA3A04Bc2E4j32OmdBIs=;
 b=PAKR2DNY/oOMoNLHX56M6qiEoh1jFQwuqtQOF2bWpEUfFOpsUbaIn8v2yiipUTbu+R
 xexRsKERvQuP86oPAjEuBZjXLKGvdrgkynsSlbtsozYyFmlNvcaCsbYQHbWUqx6uaj5Z
 Cg6QFu6T+l3hZlITT2Lrvz94srzGVB3Y5RmIqqPiEFPgjJcT3aeOMKu/zFp8mKBg4Pb7
 vOf31I4oJbqwDTTErPXRNUYMJ4fA8zHq0FADYB3H+MLDfukYOaCGWbksgcV5TIVxyefK
 eWq4fGxiQ5inzx9S+VLJDDwdVuoAz/VgC7/LlssYt1K01Ibw4oN7aAm7yUXj86RhId6+
 y50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qZQS5Ak1LtthH+ZrIJ16uurwA3A04Bc2E4j32OmdBIs=;
 b=Dedpw4xrNJPNqf8AAc6IlXAV+X9tm4wlnFapTjYsmi79MhwFWFYBiJ+dsQU+sZogA6
 o5NK/CioYLXR3hhOJyMz6UlXvfZxoTUuEB0tSM5pxNqreQN9xQuIJhkqHox6pUsPrq32
 XgwUJ16L4CvDRtSO5pNnu8dSTRVSg8pxo76+L2RJaiVPjquU29vBCad8d97/wmZHnbJD
 a7ZUVWS7HJqzuv1k4FwUMeAEMDgltUcYbdNo48C6br7TGwNMIVQ/xyCKkuYE/pWaqdiH
 RzqGuFgeYeAAqCjM78H8nasGB8Be9jBoJR2NYGKtlT/LAPwi3I22dWG+rvB76mr1R6fY
 w9GQ==
X-Gm-Message-State: AE9vXwOT6kKzZa/1vlinIeh5+cPWtahnvyVZZrdHtdDedIuq/K3kDMnT/nxnRWiJIsLkfOtmncI0ra3g20QZWw==
X-Received: by 10.31.134.195 with SMTP id i186mr3841900vkd.21.1472595353425;
 Tue, 30 Aug 2016 15:15:53 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Tue, 30 Aug 2016 15:15:33 -0700 (PDT)
In-Reply-To: <CAFd5g45-aOGnpAb4gWjz7Zz-_+3gLux61+kzZT4Wni9VZCmpLg@mail.gmail.com>
References: <1471743258-7179-1-git-send-email-brendanhiggins@google.com>
 <1471743258-7179-3-git-send-email-brendanhiggins@google.com>
 <CACPK8XfAfiuas_D3UGMf6Hf922oFH9dcHg_9QUP7xvmuTkmabg@mail.gmail.com>
 <CAFd5g45iZBEAPQtkHRUuT6aB5zTYxjW50sFMTYEw=h0u7mUJrA@mail.gmail.com>
 <CAFd5g45-aOGnpAb4gWjz7Zz-_+3gLux61+kzZT4Wni9VZCmpLg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 Aug 2016 07:45:33 +0930
X-Google-Sender-Auth: tOCbXbbf97RQlDHXMHm7aVt0k74
Message-ID: <CACPK8XdJJE7chox01OevHObvU0ENuGhMJ_FzYzDJdQ3uD_sqBA@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: aspeed: cleanup driver
To: Brendan Higgins <brendanhiggins@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Tue, 30 Aug 2016 22:15:56 -0000

On Wed, Aug 31, 2016 at 7:14 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Oh, and one more note: I moved out the eeprom quirk patch from this patch
> set because I think it makes sense as a different submission upstream.

That makes sense to me.

>
> On Tue, Aug 30, 2016 at 11:59 AM Brendan Higgins <brendanhiggins@google.com>
> wrote:
>>
>> checkpatch seems to be upset about my device tree identifiers being
>> undocumented; do we have a coordinated effort for this? I did not even see a
>> directory for aspeed under arm.

As this is a driver, the binding should be added in
Documentation/devicetree/bindings/i2c/. Use one of the recently added
existing drivers as a template. Add the binding in a separate commit,
coming before the addition of the driver. When you send it upstream
you will cc the device tree maintainers, who will ack your bindings.
The driver maintainer will then merge the two patches into their tree.

>>
>> checkpatch is also asked about updating MAINTAINERS, but looks like it
>> should be covered under existing line:
>> F: drivers/*/*aspeed*
>> Does it just ask this every time you add a file?

Yeah, I think it just complains for the sake of it.

>>
>> changelog:
>>  - Squashed driver commits as suggested by Joel
>>  - Renamed a couple functions for consistency
>>  - Fixed a couple style errors

Did you send a new version?

Cheers,

Joel
