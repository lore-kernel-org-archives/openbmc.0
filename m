Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::136; helo=mail-it1-x136.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l5wlyfDl"; 
 dkim-atps=neutral
Received: from mail-it1-x136.google.com (mail-it1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Dcmg2nb6zDq5k
 for <openbmc@lists.ozlabs.org>; Wed,  6 Mar 2019 13:15:29 +1100 (AEDT)
Received: by mail-it1-x136.google.com with SMTP id f186so4006231ita.0
 for <openbmc@lists.ozlabs.org>; Tue, 05 Mar 2019 18:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tgw8wlRARgv+uIlEIbgktmnz0BPix02O6ZKi+Y5B1rU=;
 b=l5wlyfDlY50ifUeZB16Vm1w88MGyDVzvz/qraO3yxJ0FJraEbw5ls6fufxkyv6mm8p
 ptrj3fmH3zxWqpnk7Dctjr4da6QWs9MNHt5zBWL7oaQ7n68p+yb0wjJ7FumCr7DWtTTB
 KhXmQzY5DeyrWH5suveOakEJtPE9fds2jchJ2k5KM39PYr4hhWHO1uKLU8E14aHpgm8h
 0sNWNO7TjF1RYGzsO8Uqne5SW2SF+xF8Hn0tfrlTD1pWy4TNdBfbWECve+yIa3pFyMTv
 qE6IBCpxtm626FOALY0MQhgVfDq2CKVJatDOOjvf5V+3n8PHdhpSdGHRX0PpW77G9bsN
 D3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tgw8wlRARgv+uIlEIbgktmnz0BPix02O6ZKi+Y5B1rU=;
 b=fxI9lE2d/2FHlWwr/OdxO1bXLzs1TDimtVBa8CT9zoMGBTAR8FG79gJ/JKUeoyHOry
 JegHr6rJOXVr67lFfN+pc22K7R649fcUQLz/KErYE0mb/K4CcQ8hkbFZZyzfE4LEHRC7
 /jj3fijg16TfVKexoRR/AM6nmSUY2BHgDJJr1igLkuAxz5NSnLpWCtKWFU+HKW9Egqx+
 H/yUOi/r8QDL7CEMRLl7iaCbEJpdrGgqSdZVU3LtzIQXrZf4ijLfzIhJ1NIT+8h05buK
 jNb5kq7NM9EojnyfB203wqtiADngfB3qWW42KHc0a1Y7yikBKlZYw2dGbLh3emdIFbwh
 IBsQ==
X-Gm-Message-State: APjAAAXYCLwQrFrAnfbSUVNx79KhNrY4HUcONAKhyarp8IGkBb6dfyLY
 LszEXkAbbO1QREEXelF149fORd33/fq6nRH7Xkk=
X-Google-Smtp-Source: APXvYqwLuw4iJ/w0amGXo2I+U0IJ+NwOPFh58rHyqtJGdJXkuly9qd8iOzbRRC1hyj/ec2IlCsXw6Tq5VDC6J8oBql4=
X-Received: by 2002:a02:9dd:: with SMTP id 90mr3135332jam.21.1551838525873;
 Tue, 05 Mar 2019 18:15:25 -0800 (PST)
MIME-Version: 1.0
References: <CAO=notwtEi-z1BW9T6mgTHz2uF5Y9=O=N1JpXK0sNNVyajjsGw@mail.gmail.com>
 <CALLMt=pdTeDDen1UWfGae4oDzeZoUD8wYD3YDOzsTL60YDVYrA@mail.gmail.com>
In-Reply-To: <CALLMt=pdTeDDen1UWfGae4oDzeZoUD8wYD3YDOzsTL60YDVYrA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 6 Mar 2019 10:15:11 +0800
Message-ID: <CAARXrt=9y32OO7PaeF78RJ+DMr8eyU-WOqzJYTys0nYJCcQwEA@mail.gmail.com>
Subject: Re: Bizarre CI Failure
To: Andrew Geissler <geissonator@gmail.com>
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Matt Spinler <mspinler@linux.vnet.ibm.com>, William Kennington <wak@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Mar 2019 02:15:32 -0000

> Some sort of permission issue with the generated files from the docker container
> build. This repo is pre-built into the docker container and then when CI tries
> to rebuild the repo, it's hitting permission issues with the
> pre-existing file. No idea
> why it doesn't recreate in your env though. I verified it hits multiple of our
> CI systems.

When I was checking the build error in
https://gerrit.openbmc-project.xyz/#/c/openbmc/openpower-pnor-code-mgmt/+/18795/1,
I just notice that the auto-build-and-test happens partly in docker, that the
environment is in docker, but the source code, and the generated
scripts/objects are in host side.

That seems, a bit weird, because I would expect all the build (env, source,
objects) are in docker instead of host.
