import { TestBed } from '@angular/core/testing';
import { AppComponent } from './app.component';
import { AppModule } from './app.module';

describe('AppComponent', () => {
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AppModule],
    }).compileComponents();
  });

  it('should create the app', () => {
    const fixture = TestBed.createComponent(AppComponent);
    const app = fixture.componentInstance;
    expect(app).toBeTruthy();
  });

  it('should render title', () => {
    const fixture = TestBed.createComponent(AppComponent);
    fixture.detectChanges();
    const compiled = fixture.nativeElement as HTMLElement;
    expect(compiled.querySelector('[data-test-id="random-pizza"]')?.textContent).toContain('Random pizza!');
    expect(compiled.querySelector('[data-test-id="pizza-details"]')).toBeNull();
  });

  it('should render title', () => {
    const fixture = TestBed.createComponent(AppComponent);
    fixture.componentInstance.pizza = {name: 'test pizza', ingredients: 'stuff'};
    fixture.detectChanges();
    const compiled = fixture.nativeElement as HTMLElement;
    expect(compiled.querySelector('[data-test-id="random-pizza"]')).toBeNull();
    expect(compiled.querySelector('[data-test-id="pizza-details"]')?.textContent).toContain('test pizza');
  });
});
