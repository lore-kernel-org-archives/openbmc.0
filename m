Return-Path: <joel.stan@gmail.com>
Received: from mail-qk0-x22d.google.com (mail-qk0-x22d.google.com
 [IPv6:2607:f8b0:400d:c09::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rYfSm10YNzDq5c
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 17:27:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=zb78dQNI; 
 dkim-atps=neutral
Received: by mail-qk0-x22d.google.com with SMTP id c73so9578304qkg.2
 for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2016 00:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to:cc;
 bh=v35kbR7HA1NZpyJh7GrJl1emK3nRUanKNOW70bn5m1Q=;
 b=zb78dQNI3hanAHDZZkK0Z/q+MEfQCJDNKseemsSXX/Z25BzKAX9LDL1vFtNMnBnT0z
 Nooh+SuptBkUxZP/00PVlKRXGhCKkC/oSAdbv4Dd79+5+aCIxWVrzjUblUGuH26J3qZ+
 I6z4orGbYGLUxQ+IYQp5uV8FYwoQalrvKMJqguKrb9CltbnJHv5TYb4S91fg32FpUcV7
 m5sQr5uixsXtXh5TxJPpH+TMzw+489Z40YXyd3mwaP2ZB+9ycE6SzZbwkVS7qMw8V+OH
 6bxM3RdUHNvr8sr9GCIl8DWNyxwyAcqAUfP1sYQWXqmfFX9GKrlI4ORr81HdR5jXBmgH
 mjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:cc;
 bh=v35kbR7HA1NZpyJh7GrJl1emK3nRUanKNOW70bn5m1Q=;
 b=EEmLdXzMuriT1RtICggJIFTDX7MNvm7qshKG8uxGjX7ae3s7DV0hGJ6EAAan7JjKKv
 S+pyavy28IzRI+q39LSP/4K9o4wbfsbUIbhjS5tSrp9UHYAezJz+KJdyTL4TNqlkkN27
 3+GzYCudculLot/ddpuqC8TShiGpeln/NP/jBslS7psOY5NPHgqJNIyWdj3A0583tK3v
 Q4VlPbnL68/MOEYFj3O0EkcSdN0QFb+Cu516YR1wmQpN+fxaK6JWAfVpOhsqasUwv+Kl
 6KW2ej8aQElZFXKXaUibJBa7y2aE/UIbTycUAX2M4D26KCeAHkwpamJyw0iCvq5y/nZP
 8Ksg==
X-Gm-Message-State: ALyK8tIOkE+Hq3+wdbUfEGLhVkdje1nmj5rH4dLnx/OSYDdXd5NKq+z/0SwiHrCX5cd/kwsLHlI5iAmG0wTcng==
X-Received: by 10.55.200.9 with SMTP id c9mr28015989qkj.158.1466494053803;
 Tue, 21 Jun 2016 00:27:33 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.237.37.148 with HTTP; Tue, 21 Jun 2016 00:27:14 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Jun 2016 16:57:14 +0930
X-Google-Sender-Auth: 25Xv0smQ7r0hxqrUbUFaRaoN-bI
Message-ID: <CACPK8Xezv9egJUBxBdQm4woL9B7FrusQLajhOPuYru+tbCJaDQ@mail.gmail.com>
Subject: Adding meta-raspberrypi as a platform
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jun 2016 07:27:37 -0000

Hey Brad,

Jeremy came up with the interesting idea of enabling the raspberry pi
as a simple, cheap, easy to obtain development platform for OpenBMC.

The user story is: Bazza has a dev board on his desk and a spare
raspberry pi. He wants to give UART access and power control to a
colleague on the other side of the country so they can bring up the
NC-SI stack.

He could cook up something custom, but it turns out we have this sweet
project called OpenBMC that is designed for this task.

I've been toying with the meta-raspberrypi layer[1]. Can you help me
add that to our tree and have it build an image with the openbmc
userspace?

Cheers,

Joel

[1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi
