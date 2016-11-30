Return-Path: <eajames.ibm@gmail.com>
Received: from mail-wj0-x242.google.com (mail-wj0-x242.google.com
 [IPv6:2a00:1450:400c:c01::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tTPkx36x6zDvp0
 for <openbmc@lists.ozlabs.org>; Thu,  1 Dec 2016 02:40:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FtOGEyDh"; 
 dkim-atps=neutral
Received: by mail-wj0-x242.google.com with SMTP id kp2so22743498wjc.0
 for <openbmc@lists.ozlabs.org>; Wed, 30 Nov 2016 07:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2NNGwnUXm+yinv+kNoZ8akWqP6HOxl2+UWV+nSsWRMk=;
 b=FtOGEyDhNsY5V4C50EV9EU5kAovZpZlD0dzexvkXl7IyRvG4wvrhccBXAnwoFDhBZY
 GrNemlvzvixcxljeh7rsejCXSqSQ3slM0hTMOXtQFcJSHv46Ay78i9ewcpu1tKQCdp1x
 NuKXiEtL/R9FxpC81R8wA9GSzNVnhISLV7iU7ha+vsVHBWyw+ZUfRISi+hRuDheal7nx
 wf6cyXXdBH663HrZAyhRe2SrKUC9IPDxq2UjstEEDHbubY76i1iucm0uyJfaqn8dgqM9
 cfoIILzz9l1DFjwXEoW/uOW4zrQBhRQjyrrCWK3oE23ITFh+iPlBfEbsYJOOSwTOxoNp
 7T5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2NNGwnUXm+yinv+kNoZ8akWqP6HOxl2+UWV+nSsWRMk=;
 b=RsfrOfpxla/ytiyGJO/BkBPHFvEkvQU8A9FvgDWzemjD2amAObcV2apOerZnm4Jl4O
 rkIEjjxUnhe4lnRWoKXadX7txFwNk8j/lFLVhWJD00wvLlzv+EyQoXYhE+KNXz7dXdBg
 6m8qRtnoucwwWUtPluXa6zgvBlaydgemeNyB/7HBIjApQg6eQIC0kluOJIDGu1eFZMrZ
 WkABl6qITX/UW9Fx2qdmlU0aRKuIvK0MUwiKISlFL6Bd6RMhMYmGPliVzuAQyhlorby7
 UUiplGHxd9AmKNHQB9TGHVip8FpxvWJ7pyw7QEuFSZDDXrBNMy01glSoj9Rz33CXnU4h
 /9Ng==
X-Gm-Message-State: AKaTC00c4ckO4NlJkNwcb4hnRIpVCL5NnApPIpjoasrVqYthwGrfu+TpiAMVQpfAbTuG61uQIqZ3tNvOp8QI1A==
X-Received: by 10.194.115.70 with SMTP id jm6mr29272745wjb.140.1480520436139; 
 Wed, 30 Nov 2016 07:40:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.37.229 with HTTP; Wed, 30 Nov 2016 07:40:35 -0800 (PST)
In-Reply-To: <OF325984B1.9939C9A2-ON4825807B.001350B8-4825807B.00151A1B@notes.na.collabserv.com>
References: <1480460588-28589-1-git-send-email-eajames.ibm@gmail.com>
 <OF325984B1.9939C9A2-ON4825807B.001350B8-4825807B.00151A1B@notes.na.collabserv.com>
From: Eddie James <eajames.ibm@gmail.com>
Date: Wed, 30 Nov 2016 09:40:35 -0600
Message-ID: <CALpMbdnC2NZ7MQG1qr=TNKMBTVmfPxECVxXS4Pxfih7_vnYdDg@mail.gmail.com>
Subject: Re: [RFC PATCH linux v6 2/9] hwmon: Add core On-Chip Controller
 support for POWER CPUs
To: Yi TZ Li <shliyi@cn.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Wed, 30 Nov 2016 15:40:42 -0000

Thanks Yi, I will add some checks for 0xFF in the next patch set.
Looks like that's the only non-zero rc that isn't an error.

On Tue, Nov 29, 2016 at 9:50 PM, Yi TZ Li <shliyi@cn.ibm.com> wrote:
> Hi Edward,
>
> I was concerned with bellow piece of code when writing P8 occ driver.
> Referring to occ spec:
> https://github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Interfaces.pdf
> Section: 1.6.2 OCC Command/Response Sequence and Appendix A: Return codes.
>
> OCC responds a command with different return code. Currently, the occ driver
> regards any return code
> other than 0x0 (Succeed) as error. But we may need to handle occ return code
> properly,
> e.g: for 0xFF (command in progress), we might not regard it as an error.
>
>
>
>> +
>> +static u8 occ_send_cmd(struct occ *driver, u8 seq, u8 type, u16 length,
>> +             u8 *data, u8 *resp)
>> +{
>> +   u32 cmd1, cmd2;
>> +   u16 checksum;
>> +   int i;
>> +
>> +   length = cpu_to_le16(length);
>> +   cmd1 = (seq << 24) | (type << 16) | length;
>> +   memcpy(&cmd2, data, length);
>> +   cmd2 <<= ((4 - length) * 8);
>> +
>> +   /* checksum: sum of every bytes of cmd1, cmd2 */
>> +   checksum = 0;
>> +   for (i = 0; i < 4; i++)
>> +      checksum += (cmd1 >> (i * 8)) & 0xFF;
>> +   for (i = 0; i < 4; i++)
>> +      checksum += (cmd2 >> (i * 8)) & 0xFF;
>> +   cmd2 |= checksum << ((2 - length) * 8);
>> +
>> +   /* Init OCB */
>> +   driver->bus_ops.putscom(driver->bus, OCB_STATUS_CONTROL_OR,
>> 0x08000000,
>> +            0x00000000);
>> +   driver->bus_ops.putscom(driver->bus, OCB_STATUS_CONTROL_AND,
>> +            0xFBFFFFFF, 0xFFFFFFFF);
>> +
>> +   /* Send command */
>> +   driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
>> +            driver->config.command_addr, 0x00000000);
>> +   driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
>> +            driver->config.command_addr, 0x00000000);
>> +   driver->bus_ops.putscom(driver->bus, OCB_DATA, cmd1, cmd2);
>> +
>> +   /* Trigger attention */
>> +   driver->bus_ops.putscom(driver->bus, ATTN_DATA, 0x01010000,
>> +            0x00000000);
>> +
>> +   /* Get response data */
>> +   driver->bus_ops.putscom(driver->bus, OCB_ADDRESS,
>> +            driver->config.response_addr, 0x00000000);
>> +   driver->bus_ops.getscom(driver->bus, OCB_DATA, resp, 0);
>> +
>> +   /* return status */
>> +   return resp[2];
>> +}
>> +
>
> Thanks,
> -Yi
