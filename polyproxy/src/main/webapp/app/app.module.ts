import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import './vendor';
import { PolyproxySharedModule } from 'app/shared/shared.module';
import { PolyproxyCoreModule } from 'app/core/core.module';
import { PolyproxyAppRoutingModule } from './app-routing.module';
import { PolyproxyHomeModule } from './home/home.module';
import { PolyproxyEntityModule } from './entities/entity.module';
// jhipster-needle-angular-add-module-import JHipster will add new module here
import { MainComponent } from './layouts/main/main.component';
import { NavbarComponent } from './layouts/navbar/navbar.component';
import { FooterComponent } from './layouts/footer/footer.component';
import { PageRibbonComponent } from './layouts/profiles/page-ribbon.component';
import { ErrorComponent } from './layouts/error/error.component';

@NgModule({
  imports: [
    BrowserModule,
    PolyproxySharedModule,
    PolyproxyCoreModule,
    PolyproxyHomeModule,
    // jhipster-needle-angular-add-module JHipster will add new module here
    PolyproxyEntityModule,
    PolyproxyAppRoutingModule,
  ],
  declarations: [MainComponent, NavbarComponent, ErrorComponent, PageRibbonComponent, FooterComponent],
  bootstrap: [MainComponent],
})
export class PolyproxyAppModule {}
