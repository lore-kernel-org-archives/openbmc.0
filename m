Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::232; helo=mail-io0-x232.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nqwPbipW"; 
 dkim-atps=neutral
Received: from mail-io0-x232.google.com (mail-io0-x232.google.com
 [IPv6:2607:f8b0:4001:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40nDKN53kRzDsQ6
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 13:33:28 +1000 (AEST)
Received: by mail-io0-x232.google.com with SMTP id g1-v6so4571146iob.2
 for <openbmc@lists.ozlabs.org>; Thu, 17 May 2018 20:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=crxqYn0eHIf0qwGltm30VXlRxQfGFPBxLchx+9KzEPI=;
 b=nqwPbipWrRVvzKQMQzX1FFZULPkEdvuKIiPQSBFyJumz6lNd2/paKFEfQbktbvu4pu
 ux8PW5685LJuPKZyLCn+w2+LFWcnugj0+2531c49ByIHyScnnkB711kfPcAQ5tSAhr2v
 JDsJpAXHY0TzywK9xfLgOEt5WbXMRyyrP5hcHpVEVKx9Vr9t69nLTTWsGRAovbaCREJ4
 E6X7e6XUuYUweNE1MKjwKhm5wjAWgQVhrdPw5sDH6XOklLE1+leOOgtYA3/x8yvJjrdz
 4qTD9XYEVPpIrtM/wtz8PT2Cwkdpe5fy7ruMOWgTyfc/sffvo4O0lW2SG5PACE5Ze3Iz
 xMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=crxqYn0eHIf0qwGltm30VXlRxQfGFPBxLchx+9KzEPI=;
 b=mExor4yYwbQercYgV9YvjWshnAxBBqKkcEn5UnzxcEGpbOyWDaip//1hdN89iu2gmr
 Z/rEgVB9m96RlBQ6bqWQB8tf3KwZ/UAdaFl+NwKTrzleuODn5ClJAgEos4InzDSjCjSA
 nakMkv+wyLxtHq+q90j6OA63Voukv1zJyJOvzG54sNX5qTsdoYXHcyaKRrAXy8Osr3qO
 kHMtjbBjXEHilZGnJ5DtWCbkTDLrdvq4hKaUyKpeYvOMafkPR6sPaOh+5TtX49RkhGWm
 OP1LKfrGC7QBSXYfLQRP83Lv1fUcZgX84ZrnKeY4Va4CAukAMHJp+T+WpXrAz5dhKR26
 8OYQ==
X-Gm-Message-State: ALKqPwcx7rIfyV2G/3B+KLAqplf8+z5ts2SiqYsWeBxfAmL/F5BSNfGD
 VhWSLQwx/OcV0QkRNLd3+2PHm4NGUDpEJAYyNe8=
X-Google-Smtp-Source: AB8JxZrd72c8ECvhVBNUku28IZISeT7WOzk9/lCmVSJezeBjoGfB3NEZP0gbWAoC0Kzl1kahTZuu0WLGlYZ/PfKrMwk=
X-Received: by 2002:a6b:109:: with SMTP id 9-v6mr7914515iob.138.1526614406093; 
 Thu, 17 May 2018 20:33:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:558a:0:0:0:0:0 with HTTP; Thu, 17 May 2018 20:33:25
 -0700 (PDT)
In-Reply-To: <20180516160209.GB105329@mauery>
References: <1517207425.21006.27.camel@aj.id.au>
 <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
 <87lggezywe.fsf@linux.vnet.ibm.com>
 <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
 <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
 <874lm8pjd7.fsf@linux.vnet.ibm.com>
 <e1431b039c817b23b49b6f5833760152@linux.vnet.ibm.com>
 <CAARXrtn6M=tzE-yMJWN4yaSHZJUYksMT=vMvVymY0kvgQJ4bfQ@mail.gmail.com>
 <MWHPR21MB0864432C6CB8EF9A575589B0D6930@MWHPR21MB0864.namprd21.prod.outlook.com>
 <20180516160209.GB105329@mauery>
From: Lei YU <mine260309@gmail.com>
Date: Fri, 18 May 2018 11:33:25 +0800
Message-ID: <CAARXrtksFbirzq70cLzvWRcxKxOT9rGYKPMa-+UQcMpvx0=ycw@mail.gmail.com>
Subject: Re: BMC Image Signing Proposal
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: Yugi Mani <yupalani@microsoft.com>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>, 
 Stewart Smith <stewart@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2018 03:33:29 -0000

On Thu, May 17, 2018 at 12:02 AM, Vernon Mauery
<vernon.mauery@linux.intel.com> wrote:
> On 15-May-2018 06:18 PM, Yugi Mani wrote:
>>
>> Good point. We at MSFT are using legacy (non-UBI) layout. We have a
>> manifest for boot verification and we append the hash to image for update
>> verification.
>> I can share details about the design/implementation, if you have any
>> specific questions.
>
>
> At Intel, we are using a legacy layout as well, either ping-ponging between
> partitions or using a active/temp/recovery partition scheme depending on the
> secure boot mechanism for that platform.
>

Thanks for info!
So I think it is better for OpenBMC project to have a common (or example)
image signing tools/code, not for a specific machine or product, but for the
general machines in this project using legacy flash layout.
Let's discuss and get a design proposal?

> --Vernon
>
>
