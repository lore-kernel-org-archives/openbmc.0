Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="u7aFvXvd"; 
 dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42qzxL5P4dzF33f
 for <openbmc@lists.ozlabs.org>; Thu,  8 Nov 2018 08:26:14 +1100 (AEDT)
Received: by mail-pg1-x52b.google.com with SMTP id q5-v6so7865671pgv.0
 for <openbmc@lists.ozlabs.org>; Wed, 07 Nov 2018 13:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=2IHjEMlkuelJ58XgteQCjyv2XB4iN+hfM1HiRYsHhlk=;
 b=u7aFvXvd2B6NnbSb22HkjBFiDOyj8qHYxAmnVNvP6kO/BFRYLDAtJXyjWkL5Et74cL
 7okfGfpc7nxBVkXdC0GtA3hdjVHlHh0RwoZSGi9HD7LMQzGnoF/XGRPul9UuC+Fcd4mr
 RGHuo5DRSrwYkUM4hzmyAO7SnltBfIl+d7efObWfR5DWWzX8pvbdkI8JRWmZWS8WGT6J
 ZoOjtbfx9WH3+iCtby8Qptz5tqfEEhSlLEH/xTqsmdBirW3TeeB/C6ZVpn1y4KMPZyn4
 h76YTp4jspPLaLpAqpOC31y+pi2BcWBy8HrIxuQhqtgzW876z3/71e/NqFh4ZAjSUpyx
 5+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=2IHjEMlkuelJ58XgteQCjyv2XB4iN+hfM1HiRYsHhlk=;
 b=ADjuGkCJPewnWqjXIiM0D+pYaPp95pJ61hJAF07hX3PZumniXOfUD+HQJXmEcE0PDH
 oa6wE6qAgKbd4u9rUp+uodIwIENbpz/9ZuXFH3+4yLnsjugZ3sx5GLj9q0M1uGjr4kml
 Irn+i/XR7MsH78rXhBe/W4Mz63lKC+ofUcLIRXkp/wyBR58iEsch18A87tVQp3FC7rwD
 sh+OonDd+C7wrzfJoRMHDZPGpIdUy7fqwjOtAmOHZ7xF1odFJIbQIXobs5dTtQFzY3YH
 jeS0wj9P9p4sTWUYlm/eCUy64jmqziZDWHY9lt62VBcZy0BwnuOE9tYS7uiQzzAli0Pu
 Ma/A==
X-Gm-Message-State: AGRZ1gIzVzeVWj22oaxrsCXqzJv0gigTVn4XZSkTFXAWsLrxpbv1hIpt
 g29FsgWqGh28iZd5jK1yIovURiaJg9Hh60Ty7JWp8Q==
X-Google-Smtp-Source: AJdET5c4xqTAh01TZSwKvV7idRlUart/yRy57onNMk6GG3/U2ZszdiPo0kNZKiGukTlxjg/1u18HpeJ0vUhtVhxGRdY=
X-Received: by 2002:a62:42dc:: with SMTP id h89-v6mr2011758pfd.0.1541625969849; 
 Wed, 07 Nov 2018 13:26:09 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Wed, 7 Nov 2018 13:25:58 -0800
Message-ID: <CAO=notw0CmCooo7ix+hFt+xKsdc2qYRiJ_PuOmOVYqyJwayfjA@mail.gmail.com>
Subject: LICENSE bases fixed for all open patchsets
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 07 Nov 2018 21:26:15 -0000

The license bases have been fixed for all patchsets in the topic.

Patrick
