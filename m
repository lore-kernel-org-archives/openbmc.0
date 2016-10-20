Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0C1k1gG4zDt0N
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 02:11:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=0ar4xaNz; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id 66so6394838itl.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 08:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=CEGOo/CkYjA3ib7OoZL3rY9haasOoFu8o1I9wup58MY=;
 b=0ar4xaNzlpJD+BH70Owbc4cpm/s6QV03qxzPWOGKjedAUySfaF2bnc+772EPSozaDY
 rTSs10aLP964VJYSUKQa1LvlQArJK2O0vpRbCUJWiW0WpwVoomOfyiJwRbIyHENqYoFj
 EcUxDoi348iK13Im7vVBnk1O1cgZXv6EeFoiQCobCIlGtt4iBZsLWyeIq/ciPuc+vGIF
 KACXpaqaSpOciOoWz4x1hQROmPRD+bX0GWfglQmkxO9LP39/IPDj7XE8prboZeWHeiOu
 Gu6GKOHyeMRRT8OIMlfCprreqzD2UXg3wgzIZJgocA0urIO1oepqpUKu/VmjUhlnTuyy
 PrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=CEGOo/CkYjA3ib7OoZL3rY9haasOoFu8o1I9wup58MY=;
 b=gjszUmXHGUK23qheZzbClWdMwtdVcCDPzfZoogjjKPcMF6upKfBov824bpZkV0DkZd
 8Fu238saglz+IrY+mROoU5rYtnWLOgdo6SUVhswXg9OW6E8rDRD2ouRP1CxFVDzvl3FW
 ioQd8YBWhzyjdtJ1SYdwpCNO0jBfDM0c9swWDIUpIAybmaJo5HF4zmsyVZ1gEXj7SpSh
 aTANsv8tVYqSzw9SXC4r+wd36aDzkvMqEHcTCjamWIM08zg27N3cPQSCoXVfYkghqo4i
 q5AzRCbwSITvPIo9XiOUhE781f1Ik9p33WDhLAE4occCAjfpaLwsqmy1l+JjmBlArUSL
 MUkw==
X-Gm-Message-State: ABUngvcN6vRQ3xi9yl4EJmfrZ2LebBQGFGV11r5K1+zD8J91ksmhUXVfsPchYbwveLehewdos9EX30dDdl+DHg==
X-Received: by 10.157.33.166 with SMTP id s35mr482222otb.92.1476976262985;
 Thu, 20 Oct 2016 08:11:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.9 with HTTP; Thu, 20 Oct 2016 08:11:02 -0700 (PDT)
In-Reply-To: <7cd0c036-5e16-b69a-409d-897a06c263a6@ozlabs.org>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-19-git-send-email-christopher.lee.bostic@gmail.com>
 <7cd0c036-5e16-b69a-409d-897a06c263a6@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Thu, 20 Oct 2016 10:11:02 -0500
Message-ID: <CAA0LjjWSn1emFSMBUH9AJGAihxBdYiFWx0rf-sdOFMYAgBiwYg@mail.gmail.com>
Subject: Re: [PATCH linux v5 18/18] Documenation: Add basic FSI text file
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
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
X-List-Received-Date: Thu, 20 Oct 2016 15:11:06 -0000

On Wed, Oct 19, 2016 at 9:17 PM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> Add documentation explaining the basics of FSI and how to find
>> more information.
>> +The Flexible Support Interface (FSI) is a two wire bus consisting of
>> +a serial data line and a clock capable of running at up to 166 MHz.
>> +FSI features strong data integrity with CRC protection and is capable
>> +of very high fan out.
>> +
>> +The complete hardware specification[1] for FSI is publicly available on
>> +the OpenPower Foundation website:
>> +
>> +[1] http://openpowerfoundation.org/wp-content/uploads/resources/OpenFSI-spec/content/ch_preface.html
>> +
>> +Common FSI terminology:
>> +
>> +* Master
>> +    Controller of the FSI bus.  Only the master is allowed to control the
>> +    clock line and is the initiator of all transactions on a bus.
>> +
>> +* Slave
>> +    The receiver or target of a master initiated transaction.  The slave
>> +    cannot initiate communications on a bus and must respond to any
>> +    master requests for data.
>> +
>> +* CFAM
>> +    Stands for Common Field replaceable unit Access Macro.  A CFAM is an
>> +    ASIC residing in any device requiring FSI communications. CFAMs
>> +    consist of an array of hardware 'engines' used for various purposes.
>> +    I2C masters, UARTs, General Purpose IO hardware are common types of
>> +    these engines.
>> +
>> +* Configuration Space / Configuration Table
>> +    A table contained at the beginning of each CFAM address space.
>> +    This table lists information such as the CFAM's ID, which engine types
>> +    and versions it contains, as well as its addressing range.
>> +
>> +* FSI Client driver
>> +    A device driver that registers with the FSI core so that it can access
>> +    devices it owns on an FSI bus.
>
> Is "client" something new, or is this standard FSI terminology? I would
> have thought "engine" is the term used elsewhere.
>
> Anyway, here's a little more to tie it into the kernel implementation:

Hi Jeremy,

OK will change client wording to engine and add your text.
If we can defer the description of API's I'd prefer to do that.

Thanks,
Chris

>
> ------------
> In Linux, we have a core FSI "bus type", along with drivers for FSI
> masters and clients.
>
> The FSI master drivers expose a read/write interface to the bus address
> space. The master drivers are under drivers/fsi/fsi-master-*.c.
>
> The core handles probing and discovery of slaves and slave
> engines, using those read/write interfaces. It is responsible for
> creating the endpoint Linux devices corresponding to the discovered
> engines on each slave.
>
> Slave engines are identified by an 'engine' type, and an optional
> version. Client drivers are matched and bound to these engines during
> discovery.
>
> ------------
>
> We may want to add some description of the APIs, but that should do for
> now.
>
> Cheers,
>
>
> Jeremy
