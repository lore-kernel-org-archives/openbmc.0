Return-Path: <clg@fr.ibm.com>
Received: from e06smtp17.uk.ibm.com (e06smtp17.uk.ibm.com [195.75.94.113])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qm2kq1CWQzDq5y
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2016 00:15:30 +1000 (AEST)
Received: from localhost
 by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@fr.ibm.com>;
 Thu, 14 Apr 2016 15:15:26 +0100
Received: from d06dlp02.portsmouth.uk.ibm.com (9.149.20.14)
 by e06smtp17.uk.ibm.com (192.168.101.147) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 14 Apr 2016 15:15:23 +0100
X-IBM-Helo: d06dlp02.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@fr.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by d06dlp02.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5C2CD2190061
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2016 15:15:01 +0100 (BST)
Received: from d06av09.portsmouth.uk.ibm.com (d06av09.portsmouth.uk.ibm.com
 [9.149.37.250])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3EEFM3062455906
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2016 14:15:22 GMT
Received: from d06av09.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3EEFM4i030273
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2016 08:15:22 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av09.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3EEFLL0030232; Thu, 14 Apr 2016 08:15:21 -0600
Received: from [9.101.4.42] (hermes.lab.toulouse-stg.fr.ibm.com [9.101.4.42])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id
 2CA012204C4; Thu, 14 Apr 2016 16:15:21 +0200 (CEST)
Subject: Re: [PATCH openbmc 0/3] Re-enable obmc-console and add a ssh endpoint
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
References: <1460615435-26806-1-git-send-email-openbmc-patches@stwcx.xyz>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@fr.ibm.com>
Message-ID: <570FA5F1.1020201@fr.ibm.com>
Date: Thu, 14 Apr 2016 16:15:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.7.0
MIME-Version: 1.0
In-Reply-To: <1460615435-26806-1-git-send-email-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16041414-0005-0000-0000-000013A015B2
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
X-List-Received-Date: Thu, 14 Apr 2016 14:15:32 -0000

Hello,

I tried it on a palmetto. Very nice. This is perfect for me.

For my education on the topic, what are the plans for the OpenBMC 
host console ? Is obmc-console a temporary or a final solution ? 

May be adding websockets would provide an easier integration in 
a www ui. 

Thanks.

C.

On 04/14/2016 08:30 AM, OpenBMC Patches wrote:
> Following the previous disable, this bumps us to a working obmc-console version, and adds infrastructure for a ssh-based remote console connection.
> 
> <!-- Reviewable:start -->
> ---
> This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/232)
> <!-- Reviewable:end -->
> 
> 
> https://github.com/openbmc/openbmc/pull/232
> 
> Jeremy Kerr (3):
>   Enable obmc-console project
>   dropbear: Add patch for -c <command> option to dropbear
>   obmc-console: Add ssh endpoint
> 
>  meta-phosphor/classes/obmc-phosphor-image.bbclass  |  1 +
>  ...d-c-command-option-to-force-a-specific-co.patch | 91 ++++++++++++++++++++++
>  .../recipes-core/dropbear/dropbear_%.bbappend      |  3 +-
>  .../recipes-phosphor/obmc-console/obmc-console.bb  | 22 +++++-
>  .../obmc-console/obmc-console-ssh.socket           | 11 +++
>  .../obmc-console/obmc-console-ssh@.service         | 11 +++
>  6 files changed, 136 insertions(+), 3 deletions(-)
>  create mode 100644 meta-phosphor/common/recipes-core/dropbear/dropbear/0001-dropbear-Add-c-command-option-to-force-a-specific-co.patch
>  create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console-ssh.socket
>  create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-console/obmc-console/obmc-console-ssh@.service
> 
