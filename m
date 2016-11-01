Return-Path: <alastair@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t7JXr1DjNzDvPZ
 for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2016 15:44:11 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 uA14hhPH097551
 for <openbmc@lists.ozlabs.org>; Tue, 1 Nov 2016 00:44:09 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0b-001b2d01.pphosted.com with ESMTP id 26ej0ye5vj-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 01 Nov 2016 00:44:09 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Tue, 1 Nov 2016 14:44:06 +1000
Received: from d23dlp03.au.ibm.com (202.81.31.214)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 1 Nov 2016 14:44:04 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp03.au.ibm.com (Postfix) with ESMTP id 867B93578052
 for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2016 15:44:03 +1100 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 uA14i3mc3932436
 for <openbmc@lists.ozlabs.org>; Tue, 1 Nov 2016 15:44:03 +1100
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 uA14i3uB014653
 for <openbmc@lists.ozlabs.org>; Tue, 1 Nov 2016 15:44:03 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 uA14i334014650; Tue, 1 Nov 2016 15:44:03 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D2D17A0195;
 Tue,  1 Nov 2016 15:44:02 +1100 (AEDT)
Subject: Re: [PATCH 2/3] Connect an RX8900 RTC to i2c12 of the AST2500 SOC
 at address 0x32
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 openbmc@lists.ozlabs.org
Date: Tue, 01 Nov 2016 15:44:02 +1100
In-Reply-To: <78ec53b1-5d42-27dd-c880-f829c8468b79@kaod.org>
References: <1477535233-7760-1-git-send-email-alastair@au1.ibm.com>
 <1477535233-7760-3-git-send-email-alastair@au1.ibm.com>
 <78ec53b1-5d42-27dd-c880-f829c8468b79@kaod.org>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16110104-0040-0000-0000-000001F39332
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16110104-0041-0000-0000-00000ACA3FA0
Message-Id: <1477975442.2176.112.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-11-01_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1611010083
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
X-List-Received-Date: Tue, 01 Nov 2016 04:44:12 -0000

On Mon, 2016-10-31 at 07:41 +0100, Cédric Le Goater wrote:
> On 10/27/2016 04:27 AM, alastair@au1.ibm.com wrote:
> > 
> > From: Alastair D'Silva <alastair@d-silva.org>
> > 
> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > ---
> >  hw/arm/aspeed.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> > index c7206fd..8ccac3e 100644
> > --- a/hw/arm/aspeed.c
> > +++ b/hw/arm/aspeed.c
> > @@ -100,6 +100,7 @@ static void aspeed_board_init(MachineState
> > *machine,
> >  {
> >      AspeedBoardState *bmc;
> >      AspeedSoCClass *sc;
> > +    I2CBus *i2c12;
> >  
> >      bmc = g_new0(AspeedBoardState, 1);
> >      object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg-
> > >soc_name);
> > @@ -137,6 +138,9 @@ static void aspeed_board_init(MachineState
> > *machine,
> >      aspeed_board_binfo.ram_size = ram_size;
> >      aspeed_board_binfo.loader_start = sc->info->sdram_base;
> >  
> > +    i2c12 = aspeed_i2c_get_bus((DeviceState *)&bmc->soc.i2c, 11);
> > +    i2c_create_slave(i2c12, "rx8900", 0x32);
> > +
> 
> hmm, so that is a board device ? or a SoC ?
> 
> C. 
> 

It's a board device.

-- 
Alastair D'Silva
Open Source Developer
Linux Technology Centre, IBM Australia
mob: 0423 762 819
