Return-Path: <benh@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vs9YZ06gKzDq7d
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 21:41:21 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v2RAdRbo080907
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 06:41:12 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0a-001b2d01.pphosted.com with ESMTP id 29dmhw0q6e-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 06:41:11 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Mon, 27 Mar 2017 20:41:09 +1000
Received: from d23relay10.au.ibm.com (202.81.31.229)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 27 Mar 2017 20:41:07 +1000
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v2RAewEb46137364
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 21:41:06 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v2RAeYr5007869
 for <openbmc@lists.ozlabs.org>; Mon, 27 Mar 2017 21:40:34 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v2RAeYRm007623; Mon, 27 Mar 2017 21:40:34 +1100
Received: from pasglop (unknown [9.192.199.243])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8DD15A01FB;
 Mon, 27 Mar 2017 21:40:09 +1100 (AEDT)
Subject: Re: [PATCH 11/17] aspeed: Add I2C Driver
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Simon Glass <sjg@chromium.org>, Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Heiko Schocher <hs@denx.de>
Date: Mon, 27 Mar 2017 21:40:08 +1100
In-Reply-To: <CAPnjgZ1SJQ82hxbcKg3PLvJ2RdbvsON9W_tvyVhRM7+-BnbDTw@mail.gmail.com>
References: <20170316213624.140344-1-maxims@google.com>
 <20170316213624.140344-12-maxims@google.com>
 <CAPnjgZ1SJQ82hxbcKg3PLvJ2RdbvsON9W_tvyVhRM7+-BnbDTw@mail.gmail.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
x-cbid: 17032710-0040-0000-0000-000003016C35
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17032710-0041-0000-0000-00000C7855A5
Message-Id: <1490611208.3177.77.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-03-27_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1702020001
 definitions=main-1703270094
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
X-List-Received-Date: Mon, 27 Mar 2017 10:41:22 -0000

On Wed, 2017-03-22 at 07:05 -0600, Simon Glass wrote:
> On 16 March 2017 at 15:36, Maxim Sloyko <maxims@google.com> wrote:
> > Add Device Model based I2C driver for ast2500/ast2400 SoCs.
> > The driver is very limited, it only supports master mode and
> > synchronous byte-by-byte reads/writes, no DMA or Pool Buffers.
> > 
> > Signed-off-by: Maxim Sloyko <maxims@google.com>
> > ---

Ah interesting, I was just rewriting that driver last week ... I'll
review yours ASAP.

> >  drivers/i2c/Kconfig   |   9 ++
> >  drivers/i2c/Makefile  |   1 +
> >  drivers/i2c/ast_i2c.c | 355
> > ++++++++++++++++++++++++++++++++++++++++++++++++++
> >  drivers/i2c/ast_i2c.h | 132 +++++++++++++++++++
> >  4 files changed, 497 insertions(+)
> >  create mode 100644 drivers/i2c/ast_i2c.c
> >  create mode 100644 drivers/i2c/ast_i2c.h
> 
> Reviewed-by: Simon Glass <sjg@chromium.org>
