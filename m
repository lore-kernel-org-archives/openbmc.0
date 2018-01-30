Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oKsrj/YX"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVx6c0PqkzDqyL
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 17:19:19 +1100 (AEDT)
Received: by mail-qk0-x243.google.com with SMTP id l29so8768626qkj.8
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 22:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=m3LukbpUR9avbQEJfSfH+nmiAXBTplJ2h9gXgLZq1nc=;
 b=oKsrj/YXPKxA4I29BK3lmRtIAFVm2DJVgKlH+bVHDxHihLKkuPzFctcALWo8CbNtNf
 zupLi9S73SbUDm5WpEvdtW8aTTBBHKcdlv5wsxfnng9DaqPjf9lGn5bVlVtQimwCFql7
 +lWvT0Xn6r/Q6GYnwXO0OCai4gE5FILuIUUg26ofUydC84EGutd1NozbmXngiPp2OHmg
 SDVUDmP4gVvX9ja0kfICJGZU5T+4DGE/fUFM8LmKIYd01cWmW6xdc8+IFGEPTTqwktEc
 wVNE8W9prsDN3zUaCmqIZNhgoT82mKuF22s43kP+YIbVNWxLafKaaVxCHIzhk90t3R5X
 iB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=m3LukbpUR9avbQEJfSfH+nmiAXBTplJ2h9gXgLZq1nc=;
 b=kb7JU3oJ7Pcb7VluCk+mA/E8dF81Xhl8Yi+9B4uoAqNSvoMr/i/HVWwSj1YMLFox04
 eMrMvuY7Y7/vq0+qGgJ+Tdwn0z95PxfRzV4xB1pxmEYjyNg4He+6OgtOwvAy6+yDIvQB
 kMoslbtkszznv9Mpguvi6T7XJkTwcepq2Vcw1bVodi8DssC/EMwY58ZsW5QpROfkhXoV
 pWndzRY2aVh6BaxGffBUvQ48RCPOwjo86JlY26z7YC6BZM8ULhoplWjYWaZ4NOIJZK2D
 pu7SO9RFrjdW4MCj4e0oJOV5R79rG0uSNDrtdOci24sAiB9X1Y2ymz5XBU79chjPXQ+T
 E2Xw==
X-Gm-Message-State: AKwxyteWzNFRQvUloIkTxsO9BB6pQFotAKXxorG4ol2yw39s+kEyEZAQ
 PrUqqd4YaeVH69fu5NY+7uV+oCCeRgyBsegz6BI=
X-Google-Smtp-Source: AH8x227uQgbG9qML2Df/4dmcOdEBoYGzyXflY393gHWZ7xPi+zjhf6iVIyOd/6YBbyLt+A0UCxUZXPrx5R1MHRK5GYY=
X-Received: by 10.55.95.198 with SMTP id t189mr38016279qkb.273.1517293157819; 
 Mon, 29 Jan 2018 22:19:17 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.49.93 with HTTP; Mon, 29 Jan 2018 22:18:57 -0800 (PST)
In-Reply-To: <87shaoymux.fsf@linux.vnet.ibm.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au>
 <87shaoymux.fsf@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 Jan 2018 16:48:57 +1030
X-Google-Sender-Auth: wXv8xh9rFkCiWa1sAdCkNdbB2rQ
Message-ID: <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
Subject: Re: BMC Image Signing Proposal
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: Andrew Jeffery <andrew@aj.id.au>, Alexander Amelkin <a.amelkin@yadro.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jan 2018 06:19:20 -0000

On Tue, Jan 30, 2018 at 3:17 PM, Stewart Smith
<stewart@linux.vnet.ibm.com> wrote:
> Andrew Jeffery <andrew@aj.id.au> writes:
>> On Fri, 2018-01-26 at 14:07 +0300, Alexander Amelkin wrote:

>>> 2. U-Boot already performs image checksum validation before booting a
>>> FIT image
>>
>> Typically the rootfs is not part of the FIT, so it will not be checked.
>>     Some systems supported by OpenBMC directly mount the rootfs rather
>> than booting through an initrd, which makes rootfs authentication
>> somewhat tricky. Regardless, with signed images we should expand the
>> FIT hash check to be a full signature check.
>
> dm-verity would solve that (for a ro rootfs).

dm-verity is a worthwhile technology, but being based on device mapper
and therefore block devices, we can't use it for MTD devices, which is
all of the upstream OpenBMC machines at this moment.

I would suggest using some kind of pre-mount verification of the raw
MTD device against a stored checksum would be the way to go. This
would imply the use of an initrd (as we would need somewhere to store
the tools that do the verification). The initrd itself would be
verified by u-boot checking the FIT.

Future contributors to OpenBMC that have eMMC hardware do have the
option of using dm-verity.

Cheers,

Joel
