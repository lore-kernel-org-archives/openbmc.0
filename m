Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqYRX18jlzDrPb
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 00:30:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=zFnyYKCi; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id o93so1301779oik.0
 for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2016 06:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Yq0cCnTWSzHOVg5HOeZFRpyo9dkv1M5kXy9CGtW7ymM=;
 b=zFnyYKCibSdDpCJA+C9tHOipm1hE2FzoLmJ4j1vHU4XC0ngWbQdgLWscpUWjHrn+un
 rqGivIoYon04D+HlqJJjblBOON+pHwzncXWvhP3O3cSSqQAjekslZ0/4qTpAarnFTRWS
 eSLUDTqwvzMOMD1TYgYwxNVOnh914DuFjIPkcmFh/FJrTd8jwvFzPJYMD0pGNfa19JMa
 Ct6YZD8xg/kyZxqtX8JGpxegyEWxnMlfkfDKGSdzK6F7ZmnqsOO2pGVbcyftiSK7KStt
 sFKahh+dSzZg1EcKfPkiiXv7HIVdlADocTVwyavK/wShi2EG4aDPP+N8Z0+B8+4xvzgx
 14Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Yq0cCnTWSzHOVg5HOeZFRpyo9dkv1M5kXy9CGtW7ymM=;
 b=EXj12fC1cXBRaCewHuRou4DPN1+93Fn7/lD/ZrjSpkaoC2g6UaQWhvpe+GUy2ywwlQ
 W1NBrQ+AbjLqhgWzfN1/xNFf6LQUMf2qreDYVuczlKxe0Xqc5D3r8Jf7o35QNgTuayKD
 HEkWOkY/89tePdpUwF8lROejXYO7zEdFiWRDREGfzaUeP11bgZ7kGaHa+1yGpuUnW1Y/
 zv/bzctaW/iOuXQkJHIYN1g6lCpXbDjyopqeOg4hI6ne4mExcMY1i1M/atEngGV7X50v
 myKknJnHx96sYG6SaljDcCFYFPACf/jeT7xnG4iJ/f3ibMFQ3foHXFawNKtGebpcaq3q
 7Tvg==
X-Gm-Message-State: AA6/9Rn3BiDFzgRHXJ/gAg+zKrSbSOONj8WwOKDxybc35Ei18vJln+mzFwFhH8zAhpYp1J63EgUS4emn8FGYTw==
X-Received: by 10.157.46.93 with SMTP id c29mr9303692otd.35.1475760597596;
 Thu, 06 Oct 2016 06:29:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.132 with HTTP; Thu, 6 Oct 2016 06:29:56 -0700 (PDT)
In-Reply-To: <428264fa-63bf-23a3-0a54-7acf0f3585ad@ozlabs.org>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475700868-75737-16-git-send-email-christopher.lee.bostic@gmail.com>
 <428264fa-63bf-23a3-0a54-7acf0f3585ad@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Thu, 6 Oct 2016 08:29:56 -0500
Message-ID: <CAA0LjjVtq-Mdo7zz7Aim_1Xcn_tG-PqfrEnzWgi50aYcg_S-eA@mail.gmail.com>
Subject: Re: [PATCH linux 15/15] drivers/fsi: Initialize CFAMs for read/write
 access
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
X-List-Received-Date: Thu, 06 Oct 2016 13:30:00 -0000

On Thu, Oct 6, 2016 at 1:53 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> Send break command to CFAMs to reset their logic.  If break
>> fails this serves as an indication there is no CFAM present.
>> Set various slave engine mode register defaults.
>>
>> Add new fields to struct fsi_master to manage hardware
>> workarounds for break ids, target addresses and cfam IDs.
>>
>> Limit each link scan to one CFAM.  Due to limitations in
>> hardware break commands only one can be recognized per link.
>
> I'm not sure what the restriction is there. We can only send a break
> over one link? Or something else?
>
A break can be issued on any available link.

Due to hardware bugs that vary depending on the combination of
master type and cfam type the break command must be issued to
different ID's and addresses accordingly.  This was the reason
for adding the cfam_id, break_id, etc.. to the fsi_master struct.

For example, an FSP master must issue a break to the base
address of the 3rd cfam slot on the link.  Offset 0x00600000
on a link that covers 0x00800000 of address space.
There are different requirements for cascaded masters and their
downstream cfams.   Due to this break command limitation
there cannot be more than one cfam per link.  There are also
similar issues with 'terminate' commands that are issued to
reset a cfam out of its locked bus error state.

Additionally, some cfams such as the P8/P9 have a much
larger address window that takes up nearly all of the 0x00800000
address space for a given link.  As such there can only
ever be one cfam on that particular link.

Once the hardware issues are resolved related to break and
terminate commands then some links would be able to support
multiple cfams.

Since the first fsi code delivery will deal with basic one cfam per
link configuration platforms to start with I don't think this is
something to gate release of a first pass fsi device driver.

>> +/*
>> + * Issue a break command to this link
>> + */
>> +static int fsi_master_break(struct fsi_master *master, int link)
>> +{
>> +     int rc;
>> +     uint32_t cmd = FSI_CMD_BREAK;
>> +
>> +     rc = master->write(master, link, master->break_id, master->break_offset,
>> +                        &cmd, sizeof(cmd));
>> +     if (rc) {
>> +             dev_warn(master->dev, "break to %02x:%02x failed\n",
>> +                      link, master->break_id);
>> +             return -ENODEV;
>> +     }
>> +     udelay(200);            /* wait for logic reset to take effect */
>> +
>> +     rc = master->read(master, link, master->break_id,
>> +                       FSI_SLAVE_BASE + FSI_SMODE, &cmd, sizeof(cmd));
>> +     dev_info(master->dev, "smode after break:%08x rc:%d\n", cmd, rc);
>> +     if (rc) {
>> +             dev_warn(master->dev, "read smode after break failed\n");
>> +             return -ENODEV;
>> +     }
>> +
>> +     return rc;
>> +}
>
> This seems very specific to one particular master implementation. What
> is a GPIO-based FSI master supposed to do here? Decode the write to
> specific master addresses and then perform the GPIO sequences for a
> proper break?
>
> Instead, the break should be added as an operation on a struct
> fsi_master:
>
>   struct fsi_master {
>         struct device   *dev;
>         int             idx;
>         int             n_links;
>         int             (*read)(struct fsi_master *, int link,
>                                 uint8_t slave, uint32_t addr,
>                                 void *val, size_t size);
>         int             (*write)(struct fsi_master *, int link,
>                                 uint8_t slave, uint32_t addr,
>                                 const void *val, size_t size);
> +       int             (*break)(struct fsi_master *, int link);
>   };
>
> - then the FSI master implementations can do what's required for
> sending a break. Then, the core's defintion of fsi_master_break()
> becomes:
>
> static int fsi_master_break(struct fsi_master *master, int link)
> {
>         int rc = 0;
>
>         if (master->break)
>                 master->break(master, link)
>
>         return rc;
> }

OK, I'll make that change.

>
> Cheers,
>
>
> Jeremy
