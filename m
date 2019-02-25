Return-Path: <jandraara@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c2f; helo=mail-yw1-xc2f.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AToX6tvN"; 
 dkim-atps=neutral
Received: from mail-yw1-xc2f.google.com (mail-yw1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 447bwn5ltYzDqLH
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 09:20:09 +1100 (AEDT)
Received: by mail-yw1-xc2f.google.com with SMTP id k14so4314910ywe.4
 for <openbmc@lists.ozlabs.org>; Mon, 25 Feb 2019 14:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kQiUzpVuWH3DEX6wG7CLDOxqEbyOE7/uKSzh9x4hfCg=;
 b=AToX6tvNERyAwo1oWudFInSpvQamUWN0reLhp7IeUOsyXZTZlnqHqukS6mBmJz9oyB
 64CLvUPDt2zn926DEl9vvhbxs5JqzQsEdO8OylPhBPlstyjUOzF8tSd4j/p0epaVu/I8
 DjCdBQs0bEZQZndNnZOiEd7VmaOwNze+v3wdjaxD6GwlWBUvhZPhnvi2zqx8b4Ofd5rp
 WHE9KqICXBcEyE7ywXXc+taHAXBm7ldY9utb9xM/XxRjpVOLRf3ErSy3hYLhZg0pEHmS
 a/x5uCkXb9YJH2iv0nJOjn+gqP+3YlgdQ6VoxlywUoPBWAj6VEanjL6UXkKS6/mgeOd3
 rEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kQiUzpVuWH3DEX6wG7CLDOxqEbyOE7/uKSzh9x4hfCg=;
 b=aYX388ANGOWaf1xDUVah6mTUmKgXrDo9nx2VrMEH02kGl/jfTEc1uChFTdSfH7NJfi
 9aOFa08XKqu1NCgcuCKR2O9m/RnZe0pVgbzL9YHK01IdQ7/PI3BknmGRdwGsZ9YtPdez
 C7ghhmb9cgJj3mYxk1AEqyjYIjknwDcm5zOTEO13LX6Y+K3IGx9HENyp0jONYm0mcIUx
 iC9k+QPAj2S6oVIWTE6eRjYR5q/uyUHOeYLHUrodJsDxoWLAAs5i29pkX92YweoOAZ/Q
 q7Sm9V4yHzGhb1aTjDuMKbjMXY4Sp85YVlCzW8NrYgQgmt+qNjU01g01ILlPdUi9uZ2J
 pOIg==
X-Gm-Message-State: AHQUAuZ3tBo/HzwkkmFMGEBDfQsfKpb77B7bz/1WJpkAlHjftYgxhxuH
 eYduHErSXS87p7PXZ0ZUxDl1MdOAzKBQMdwlXwn270Xr
X-Google-Smtp-Source: AHgI3IbRKlIajffkQ7v+Crr7gFfzAO8hC36QdZdZVE3subr4zjeSu8KxNj3F9sMxHPNsIVq+ybw6Z66sfkq0lMDY/LM=
X-Received: by 2002:a81:1690:: with SMTP id 138mr16132008yww.276.1551133205645; 
 Mon, 25 Feb 2019 14:20:05 -0800 (PST)
MIME-Version: 1.0
From: ja az <jandraara@gmail.com>
Date: Mon, 25 Feb 2019 16:19:55 -0600
Message-ID: <CAMTupoQ-tMw44SqtPZx4nnDe9tf6oWjt2EUUbdeAEowkhGiJEg@mail.gmail.com>
Subject: Reminder : UI Feedback Session - Network Settings
To: openbmc@lists.ozlabs.org
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
X-List-Received-Date: Mon, 25 Feb 2019 22:20:10 -0000

Team,

There was a desire to discuss the Network settings designs presented
during the demo last week. I have set a meeting for tomorrow and
welcome you all to join.

Meeting info:
Tuesday Feb 26 at 7:00 AM CST
https://ibm.webex.com/meet/jandra.aranguren
United States of America Toll +1-669-234-1178  Access Code: 927 646 009

Network Settings:
https://ibm.invisionapp.com/share/RQNYHJ0VBDY#/319002386_V2_Networking_Mutliple_VLAN
- Is the relationship between VLAN and interfaces correct?
- Are adding a DNS server and adding an IP address separate actions
with a single intention or are they independent of each other?
- Is there a use case for combining static and dynamic IP Addresses /
DNS Servers?

github issue:
https://github.com/openbmc/phosphor-webui/issues/62

Best,
Jandra Aranguren
