Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x234.google.com (mail-ob0-x234.google.com
 [IPv6:2607:f8b0:4003:c01::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id BEA4C1A2CEC
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 12:14:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=aspIVUn5; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=TFjK+Zwc; 
 dkim-atps=neutral
Received: by obbza9 with SMTP id za9so68327643obb.1
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2015 18:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=qJU79vGvd7hnUt51elKrRbIec1WfEQ3zc2nx22GJ08w=;
 b=aspIVUn5Ws4kCTAi6SXQqvdkVeVYv7LJ2KDs2KdTZIuQXxGdnHcCMTYWcT1WU18cHy
 oukfQrcC1mV9tvV+VZhnRZML72xEAAGWs/EVbkEXMVxNr83QWTXueCBJkI7XeUOfSrj7
 Fl48SLigXlgxeV+S7tNxa2E6ZS4f31SlGNo4AG5k8N8EqDf7TWeDJGO/I6h/WjIS1VC3
 d/2SV/VCs8iOUgOfcM6vtkxPKguiUocxVE24T96FA+4YsjDlgmoMwxw/I6WxKOJToHxE
 DMchROm3ziF9hQJnYZuKmHTZ9DFl9cNDXNNio4tfBGsE8KgPLzoeKRvAsbLDzvBBH9m+
 W/Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=qJU79vGvd7hnUt51elKrRbIec1WfEQ3zc2nx22GJ08w=;
 b=TFjK+Zwcd/wIDSrns+88KG6YI8peMYszdmcn6iheyDbPYRgse/aGOx7ShQ7Iw0PENp
 uYeu0AGXwUZIH6xDV4963p0KV24NRMwPBrIBwDjlP0cwL1mZkaeqzpzM3IxiTS5lMP9I
 3sDJi8V5rJQJo52cz76N4jMTcItTHXLKkcCbI=
X-Received: by 10.60.178.74 with SMTP id cw10mr26021805oec.6.1445994852299;
 Tue, 27 Oct 2015 18:14:12 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Tue, 27 Oct 2015 18:13:52 -0700 (PDT)
In-Reply-To: <201510271331.t9RDVvi1017078@d03av03.boulder.ibm.com>
References: <1445951600-17505-1-git-send-email-patches@stwcx.xyz>
 <1445951600-17505-3-git-send-email-patches@stwcx.xyz>
 <201510271331.t9RDVvi1017078@d03av03.boulder.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Oct 2015 11:43:52 +1030
X-Google-Sender-Auth: STcfF8lqyzOfIjWTEXfCd8ZZGG0
Message-ID: <CACPK8XfeRSMrbOvw7wG=kKcxLvK+gt=LHa98r7wr+m3E61be6Q@mail.gmail.com>
Subject: Re: [PATCH linux 2/3] gpio/aspeed: Expose entire bank as one gpio chip
To: Norman James <njames@us.ibm.com>
Cc: OpenBMC Patches <patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Oct 2015 01:14:16 -0000

Hi Norm,

On Tue, Oct 27, 2015 at 11:58 PM, Norman James <njames@us.ibm.com> wrote:
>
> Will the old gpio #'s still work with this?

You will need to update the numbers.

Jeremy, can you let Norm know how to calculate the numbers? Perhaps
some documentation in the docs repo as a cheatsheet?

> Can I export by gpio pin name? echo "A3" > /sys/class/gpio/export?

It appears the gpio subsystem does not allow for this; we need to
export by numbers. Once you have exported the device it shows up with
the GPIOX# name as used in the datasheet and schematic.

Have you been able to do this on other platforms?

Cheers,

Joel
