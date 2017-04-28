Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDb1b2QCNzDq5b
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 10:54:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="R4zPwoTo"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id 19so2013437ybl.2
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=J5hrJmFzBwPINScJk+eiuT8bXv7KGB1jY+ZFGMmA2l0=;
 b=R4zPwoTouQE4lVBT8c24yNkKY1ELgH5+ucjzGmJRCZHNQ9077Uf15vXOU32HbdNYLm
 /jza6fZqOYFUxnbFbmOUOxH0YhqNGJFKYqoW/fPbgiSG1e21nHX7Z3qzIlFRa8F92UqY
 SZz96rT7pMWb7f7fojioRk6Iphr0hm0k8/8UyWxsxPds5e2gfzwdmyksik/9Yaafvukl
 a9xMYpcMcU7lXU3ddz5eC0x9F5VYG+4t8zLdIXNEjMxTK7Sr7+mcwguGZejrIOmbcGBA
 MPaLTz5hqFz1xugP4U4jJnKDrPKRy4mMesQ2iiqio6dkfR+LtjQnPhVh6Sux1L8bKa9X
 e5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=J5hrJmFzBwPINScJk+eiuT8bXv7KGB1jY+ZFGMmA2l0=;
 b=N2zDdVRka5lgzvMsLADsofCWJ3sW1y4Ks72amaa1vlzGumvGc3Dk48rk5ELTaZSRJR
 FCnX5zrxWcocyaSBQKYLR9C8tgEawwXZw0yr6dr+e1jlxWrhhYP+Xg7qJpD7m8H5ufBz
 rvb2TIqSXBnQ58/YN+eItYTv4UfUFAQjt6lWuN5u2FZmRy0EarPkXVPNz6LeilP+lQ/w
 3G5FQU4KM9kZWzXZbWqf4C1eVpJv7E3khNXX6uxYWpWF9IrHZM/Y6Zzhj+BmjZGy3Zyx
 HmeebVMKQBiIOFIkPA6Pp9ZYtXHVH9O3gq0773s0zqVZaqmHbv4DyCMzk36og3ONeg75
 Ce0A==
X-Gm-Message-State: AN3rC/5Jx6v5ExBiAgnJ3jjCOTdNN87gnD1TQm2ykUIIgvgLDuLCKJKo
 7OjRBWTloru6DmPgfCQXQ81qBLY+Tg==
X-Received: by 10.37.110.198 with SMTP id j189mr6963087ybc.123.1493340864934; 
 Thu, 27 Apr 2017 17:54:24 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.171.70 with HTTP; Thu, 27 Apr 2017 17:54:04 -0700 (PDT)
In-Reply-To: <CAPH-5w5MgSJdycVn=zQJZzy75Z_E3DA7BemcN8j4KjSomSy=kw@mail.gmail.com>
References: <20170427060823.32226-1-andrew@aj.id.au>
 <20170427060823.32226-7-andrew@aj.id.au>
 <CAPH-5w5MgSJdycVn=zQJZzy75Z_E3DA7BemcN8j4KjSomSy=kw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 28 Apr 2017 10:24:04 +0930
X-Google-Sender-Auth: zhv7zZop5uFcVCADreV7BPgOhY4
Message-ID: <CACPK8Xff6aO17BXxCX9_9YPPk7=W_uFvTYhGuetk_J2y-C-FuQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 06/10] aspeed: zaius: Remove LPC-to-AHB
 bridge configuration
To: Xo Wang <xow@google.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Mine <mine260309@gmail.com>, 
 Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Fri, 28 Apr 2017 00:54:28 -0000

On Fri, Apr 28, 2017 at 2:47 AM, Xo Wang <xow@google.com> wrote:
> On Wed, Apr 26, 2017 at 11:08 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> This is handled by the mbox daemon via the lpc-ctrl driver.
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

> Reviewed-by: Xo Wang <xow@google.com>

Applied to dev-4.10.

Cheers,

Joel
