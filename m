Return-Path: <sjg@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c0d::236; helo=mail-qt0-x236.google.com;
 envelope-from=sjg@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="vq/PMSag"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="OYOjFDYX";
 dkim-atps=neutral
Received: from mail-qt0-x236.google.com (mail-qt0-x236.google.com
 [IPv6:2607:f8b0:400d:c0d::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yLJqm2Tm4zDqhf
 for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2017 01:36:19 +1100 (AEDT)
Received: by mail-qt0-x236.google.com with SMTP id 8so26410710qtv.1
 for <openbmc@lists.ozlabs.org>; Mon, 23 Oct 2017 07:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=81qlauNT1eXWQ7WZuYT0kjhhBx7TigPldtTIXq7VvT0=;
 b=vq/PMSag7QhxL4HzuTmKsKpI13DEQn2bmZBcyfNL9yW/Y+qIhB/4V3XL0bkO2J6Iea
 e4OKkfCJjWv8CEnIRPqdOHXTD9unDYCoPelatfTEZg3DwC8HHa8ZGGeTSRMEd5HUJOI/
 0kpRrbHYuDeWn9gNoVF1GPC222SPIvYMwZ6xgn6jnBqjwILwivON/6DYtrCWj9wR7wY4
 Cf4ehsRCO01RiqWwbDSDTV6ypkvWES6o6uRRc5ZaU/AGIVGCm70A9IgfYLHFZDlbL4jE
 0oi4Hiejb+oL33IkqngxonNDD5bb2KrRWpWScCNkAFuuQdHrK8pCCIO+rZUz9NAttfvk
 vuww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=81qlauNT1eXWQ7WZuYT0kjhhBx7TigPldtTIXq7VvT0=;
 b=OYOjFDYXM5Sb+G57LvgW8xqKmV5g4DeeCKj5GTWl4gyCXW9+qTLPs1WFxW3leGfxiB
 X2eioKbYe8vCy647sdTFYs+K0c0842mB5c6s+aUEAinr8ov9a1uz7TmllMGqagpLoJcx
 a31xIMW9P0OxrgahVt0aIvVYbAtL5GNicBUrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=81qlauNT1eXWQ7WZuYT0kjhhBx7TigPldtTIXq7VvT0=;
 b=d+EjcAbpX7ce6nMW+UggrEVOeEexOui4JhuViu7QKzlJ6mgk9vlPIh0zgBFIz+9aIV
 m6zHLcFTyVqmu9EvBqkkbU3vg67j5PaTywsFMD8ecXw3TrJlNNt0wU0dyhcvS6V4Mna5
 Hx7lKoNhHoXWphhypewF3YJ/WUChvr3RikdasP9nzAcA2J6Oe6tONjgfh6drEL6Ccq4c
 76nkQge0zjT2wjH5OrwFi/xKALULfU85WJ6BRVdmicp5JBneLSBYiJDK/jwonTDa0le5
 lQ6DRNBfzX+ERBWXtaw2snxwF2w/lqEL/PeSYfNGksUBBE1ZHa7XJU3IQerZWc/9TW9H
 uI+w==
X-Gm-Message-State: AMCzsaXz5weFr2i/xJuwRfDP/vlMLBMcKAWitW0pARmadfiQZCuAsnZW
 LZstUGLyfj7EUCoi/aD+eIXQze7lhz0ouf58fm6Sew==
X-Google-Smtp-Source: ABhQp+QtUEJ7oN74m41pb6AxY9PomGlx640GzD53OSisVg6tHB5RrI+Jc+SpE1ZDXoLrRXFKlWSnLJ/S2aHkyrhr8XA=
X-Received: by 10.237.62.200 with SMTP id o8mr20486362qtf.92.1508769376886;
 Mon, 23 Oct 2017 07:36:16 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.140.100.227 with HTTP; Mon, 23 Oct 2017 07:35:56 -0700 (PDT)
In-Reply-To: <OF63DDCE9F.99DF1057-ON002581B9.000E0A44-1507948401492@notes.na.collabserv.com>
References: <OFF0AEFDA9.8819F371-ON002581B8.007FA002@LocalDomain>
 <OF63DDCE9F.99DF1057-ON002581B9.000E0A44-1507948401492@notes.na.collabserv.com>
From: Simon Glass <sjg@chromium.org>
Date: Mon, 23 Oct 2017 16:35:56 +0200
X-Google-Sender-Auth: TSvyTqzroL6GC2d3o216Z7dBXMA
Message-ID: <CAPnjgZ19GjVpCAgmCY44qHD+76UjsuKXb2jfKX9nj2Ur6qejkA@mail.gmail.com>
Subject: Re: Call for maintainers
To: Chris Austen <austenc@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Oct 2017 14:36:21 -0000

Hi Chris,

On 14 October 2017 at 04:33, Chris Austen <austenc@us.ibm.com> wrote:
>
> Hi Simon.  The goal is to stay as close to master as we can.  We=E2=80=99=
ve done a better job at proving that with our 4.3-4.7-4.10 kernel and 1.7-1=
.8-2.2 yocto upgrades over the last 1.5 years then with our u-boot.
>
> I know we would like to move up on U-Boot and the reason we have not is s=
imply a lack people power.
>
> I=E2=80=99m sure we can figure out a cadence that would work for you.

OK, let me know who to connect with / what to do.

Regards,
Simon

>
> Sent from my iPhone
>
> On Oct 13, 2017, at 6:14 PM, Simon Glass <sjg@chromium.org> wrote:
>
> Hi Chris,
>
> On 9 October 2017 at 19:04, Chris Austen <austenc@us.ibm.com> wrote:
>
>
> Greetings,
>
>
> I received some feedback that people would like to know more about what i=
t takes to become, and duties of, a Maintainer in OpenBMC.
>
>
> A Maintainer is a lead position in the project who is intrusted with arch=
itecture and stability. In return you will have a say in the future archite=
cture.
>
>
> Steps to get there...
>
>
> 1) Pick a project repository that you have matured
>
> 2) Sign up for reviews in that repository without being asked
>
> 3) provide comments that correctly shape the goals of the repository
>
> 4) Be on architecture calls to learn from others
>
> 5) Contribute code
>
> 6) Contribute socially (IRC, mailing list feedback, writing articles that=
 end up on /. , etc)
>
>
>
> I might be interested in being U-Boot maintainer.
>
> But I'd like to understand how close to upstream you plan to be? Will
> you select a U-Boot release and stick with it for a year or more, or
> will you try to target each U-Boot release (currently every two
> months)?
>
> For U-Boot specifically you could cc the U-Boot mailing list and see
> if anyone else is interested there.
>
> Regards,
> Simon
>
>
