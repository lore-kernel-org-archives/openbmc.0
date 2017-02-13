Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x244.google.com (mail-yw0-x244.google.com
 [IPv6:2607:f8b0:4002:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vM83s2MfszDqBW
 for <openbmc@lists.ozlabs.org>; Mon, 13 Feb 2017 13:03:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XoNBbQcZ"; 
 dkim-atps=neutral
Received: by mail-yw0-x244.google.com with SMTP id u68so6288537ywg.0
 for <openbmc@lists.ozlabs.org>; Sun, 12 Feb 2017 18:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=/r6+N03kEdqD8FZePNpKCm1Fjbygp1jX6xFEyYlmO7U=;
 b=XoNBbQcZ0fnxtnaNTUBZnK2jenfGSu72haJALZFsQ1LULGd5SmRLJyPgvtS5815uF6
 ulFuLZS/EVwcLk37JlvCOSJ0eGT+GQkm+HhoaQ8395sU5xBcevPNhLfZLP6o82pogazj
 mrmQj+aSLfv0dXlzHiULPjgMnZThi+jmgn5c+A5MZm9PH7dM3Ew9NiINSuFfulJxioU4
 J3aq7Wz3OTCQXCB6cm1AnBcHer0d6Bqg2M6CJzx7+yI9JKfUoHEeupygVM7h5kynMOxJ
 cRYhchUIjNTUemXsgL4bUi965RDn13/4LM+j/SUgiQxC7fwvLuacCM930v+VSpZazMXN
 /zCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=/r6+N03kEdqD8FZePNpKCm1Fjbygp1jX6xFEyYlmO7U=;
 b=n8xcbO80OIDq6hc+BCuxxoH99uwpnab5YegFBRpMe7vcjcLiZvGstLwygOvGFb4l7L
 zmYvf+2tAdEiwM8bnHf3nxgyW76p4QGmX3kNA7XZMaDYzUQ6IjY+UmHs1JR4vKII0gvw
 EJyp6nQcdPZCADltASxWQEIhGxq1XToSZHX+CEd2tPfccfgJGNtkdCtRWwhmrgXKq5fK
 I73cewsM4K6Hw+UEYDtR8UJVjcZWqzWPWeTerPzJL19exxigi22fSmpeCg9hH2xVMKsq
 X6L1iQUi01ZssH31gRGH706Nv/GWW+m6pchek+YCiOgoKg4KEGSd+qCfJnGiquhV6NAp
 hgLw==
X-Gm-Message-State: AMke39m7rWqJbxKqCJXR53UxzE/YN2kvB21AA8HnY0IpH6VKVWPPToqRLUCVsei00IZsHW1+11sKki8VAdyiow==
X-Received: by 10.13.202.195 with SMTP id m186mr14476520ywd.11.1486951431188; 
 Sun, 12 Feb 2017 18:03:51 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.41 with HTTP; Sun, 12 Feb 2017 18:03:30 -0800 (PST)
In-Reply-To: <9399734a-951d-3dce-d012-c0adcf6a2c5e@linux.vnet.ibm.com>
References: <1486745362-7790-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1486745362-7790-2-git-send-email-eajames@linux.vnet.ibm.com>
 <9399734a-951d-3dce-d012-c0adcf6a2c5e@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 13 Feb 2017 12:33:30 +1030
X-Google-Sender-Auth: 2h-XaOCfSoU7T_uoF4zIJUqHpTk
Message-ID: <CACPK8XfV1kdMu01rQF81td=SXnPRjhP+orEVbSYOugGJ=_Ajzg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 v2 1/2] drivers: fsi: i2c fix probing
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Edward A. James" <eajames@us.ibm.com>
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
X-List-Received-Date: Mon, 13 Feb 2017 02:03:53 -0000

On Sat, Feb 11, 2017 at 3:29 AM, Christopher Bostic
<cbostic@linux.vnet.ibm.com> wrote:
> Acked-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>
>
>
> On 2/10/17 10:49 AM, Eddie James wrote:
>>
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> resolve the problems when probing up the i2c driver a second time.
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>

Applied to dev-4.7.

Cheers,

Joel

>> ---
>>   drivers/fsi/i2c/iic-fsi.c  | 125
>> +++------------------------------------------
>>   drivers/fsi/i2c/iic-mstr.c |  42 +++------------
>>   2 files changed, 14 insertions(+), 153 deletions(-)
